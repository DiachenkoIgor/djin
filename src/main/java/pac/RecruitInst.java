package pac;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 * Created by 1 on 15.05.2017.
 */
@Repository
public class RecruitInst {

    @PersistenceContext
    private EntityManager entityManager;

@Transactional
public void addRecruit(Recruit r)
{
    entityManager.persist(r);
    entityManager.flush();

}

@Transactional
public void update (Recruit r)
{

    entityManager.merge(r);

}
    @Transactional
public Recruit find(String email)
{
    try {


        Query query = entityManager.createQuery("SELECT c FROM Recruit c WHERE c.email =:emal");
        query.setParameter("emal", email);
        Recruit r= (Recruit) query.getSingleResult();

       return entityManager.find(Recruit.class,r.getId());
    }catch (javax.persistence.NoResultException  ex)
    {
        return null;
    }
}
@Transactional
public void remove(Recruit r)
{
    Recruit ro=entityManager.getReference(r.getClass(),r.getId());
    entityManager.remove(ro);
}
@Transactional
    public Recruit findById(long id)
{
    return entityManager.find(Recruit.class,id);
}
}
