package app;

/**
 * Classe responsável pelo gerenciamento do banco de dados Originalmente feito
 * utilizando MySQL Tabela = consulta
 */
import java.sql.*;

public class sql {

    private static final String driver = "com.mysql.jdbc.Driver";
    private static final String user = "root";
    private static final String pass = "1q1a2w2s3e3d";
    private static final String url = "jdbc:mysql://localhost:3306/mysql?useSSL=false";

    //Manipulation Methods
    //<editor-fold defaultstate="collapsed" desc="INSERT INTO...">
    public static String insert(String medico, String especialidade, String paciente, String data,
            String hora, String convenio) {
        String query = "INSERT INTO consultas.consulta "
                + "values (default, ?, ?, ?, ?, ?, ?)";
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            return (e.getMessage());
        }
        try (Connection jdbc = DriverManager.getConnection(url, user, pass)) {
            PreparedStatement stmt = jdbc.prepareStatement(query);
            stmt.setString(1, medico);
            stmt.setString(2, especialidade);
            stmt.setString(3, paciente);
            stmt.setString(4, data);
            stmt.setString(5, hora);
            stmt.setString(6, convenio);
            stmt.execute();
            return ("Dados Inseridos.");
        } catch (SQLException e) {
            return "Erro ao inserir os dados, por favor checar se o o maximo de"
                    + " caracteres não foi excedido.";
        }
    }
    //</editor-fold>

    //Search Methods
/*    public static List<Consulta> select() {
        try (Connection jdbc = DriverManager.getConnection(url, user, pass)) {
            String query = "SELECT * FROM consulta";
            List<Consulta> consultas;
            try (PreparedStatement stmt = jdbc.prepareStatement(query)) {
                ResultSet rs = stmt.executeQuery();
                consultas = new ArrayList<>();
                while (rs.next()) {
                    Consulta consulta = new Consulta();

                    consulta.setConvenio(rs.getString("convenio"));
                    consulta.setData(rs.getString("data"));
                    consulta.setEspecialidade(rs.getString("especialidade"));
                    consulta.setMedico(rs.getString("medico"));
                    consulta.setPaciente(rs.getString("paciente"));

                    consultas.add(consulta);
                }
            }
            return consultas;
        } catch (SQLException e) {
            System.out.println("SQL Exception found!");
        }

        return Collections.emptyList();
    }
}
/*