//
//  JogoTableViewController.swift
//  Fixação II - Table
//
//  Created by Usuário Convidado on 24/08/23.
//

import UIKit

class JogoTableViewController: UITableViewController {

    var meuIndice=0
    
    var imagem = ["hor", "unc"]
    var jogo = ["Horizon Zero Dawn", "Uncharted 4"]
    var studio = ["Guerrila", "Naughty Dog"]
    var nota = [5, 4]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return jogo.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = jogo[indexPath.row]
        cell.detailTextLabel?.text = studio[indexPath.row]
        cell.imageView?.image = UIImage(named:imagem[indexPath.row])
        cell.accessoryType = .detailButton
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            jogo.remove(at: indexPath.row)
            imagem.remove(at: indexPath.row)
            studio.remove(at: indexPath.row)
            nota.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        meuIndice = indexPath.row
        performSegue(withIdentifier: "abc", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        //print("O jogo \(jogo[indexPath.row]) possui nota 5")
        let alerta = UIAlertController(
            title: "Aviso",
            message: "O jogo \(jogo[indexPath.row]) possui nota \(nota[indexPath.row])",
            preferredStyle: UIAlertController.Style.alert)
        
        alerta.addAction(UIAlertAction(
            title: "Fechar",
            style: UIAlertAction.Style.default))
        
        present(alerta, animated: true)
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let t = segue.destination as! ViewController
        
        //t.texto = jogo[tableView.indexPathForSelectedRow!.item]
        t.texto = jogo[meuIndice]
        t.foto = UIImage(named: imagem[tableView.indexPathForSelectedRow!.item])
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Jogos PS4"
    }
    
  
}
