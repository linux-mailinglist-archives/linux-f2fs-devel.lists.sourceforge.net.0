Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5164C4C3B32
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Feb 2022 02:47:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nNPhu-0006zu-6f; Fri, 25 Feb 2022 01:47:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hdanton@sina.com>) id 1nNPhp-0006zo-L4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Feb 2022 01:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9TnqeE1FRq17Du/Me4KAi0N+KXltMMVNKdKQZRcbFA0=; b=Ocmm6oJgAJ+irvpMnIva5zJvk+
 K+/nQlYT3BdHQgqM27UcqrqhCaakX4idnloizn2Q9Ur5n/1/6PL9OoUuXpAXuxy9pzhaqg3ZRdum/
 qQ5M/OGoff2AD132OcZ50bEvwKDYy4fS6luhvi7D0/ShE0fKvBVQk2S8Nz4mwXb5aA3A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9TnqeE1FRq17Du/Me4KAi0N+KXltMMVNKdKQZRcbFA0=; b=nQTSGA6J2YBOt45VEmUWeri2aX
 UKN2nVDAFunp95Fk9g9Z6H2e6aTszAa94RFLmzf4yFSbjJo90VRis7ddhymOeFt9ltFeDt9cv28Kv
 dYE2a3NUwmW1YN2Uq+rmGlUtR+r7J/5eUde8a78GSHMsuug1ofEP8Ie5gloHPVICzc+g=;
Received: from r3-21.sinamail.sina.com.cn ([202.108.3.21])
 by sfi-mx-1.v28.lw.sourceforge.com with smtp (Exim 4.94.2)
 id 1nNPhm-00EMvi-F6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Feb 2022 01:47:36 +0000
Received: from unknown (HELO localhost.localdomain)([114.249.61.131])
 by sina.com (172.16.97.32) with ESMTP
 id 6218350100004542; Fri, 25 Feb 2022 09:46:43 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 529887629039
From: Hillf Danton <hdanton@sina.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 25 Feb 2022 09:47:16 +0800
Message-Id: <20220225014716.2326-1-hdanton@sina.com>
In-Reply-To: <20220224084730.2226-1-hdanton@sina.com>
References: <20220108164617.3130175-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 24 Feb 2022 16:47:30 +0800 Hillf Danton wrote: > On
 Sat, 8 Jan 2022 08:46:17 -0800 > > From: Tim Murray > > > > f2fs rw_semaphores
 work better if writers can starve readers, > > especially f [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.21 listed in wl.mailspike.net]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [202.108.3.21 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [hdanton[at]sina.com]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nNPhm-00EMvi-F6
Subject: Re: [f2fs-dev] [PATCH] f2fs: move f2fs to use reader-unfair rwsems
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, Tim Murray <timmurray@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 24 Feb 2022 16:47:30 +0800 Hillf Danton wrote:
> On Sat,  8 Jan 2022 08:46:17 -0800
> > From: Tim Murray <timmurray@google.com>
> > 
> > f2fs rw_semaphores work better if writers can starve readers,
> > especially for the checkpoint thread, because writers are strictly
> > more important than reader threads. This prevents significant priority
> > inversion between low-priority readers that blocked while trying to
> > acquire the read lock and a second acquisition of the write lock that
> > might be blocking high priority work.
> > 
> > Signed-off-by: Tim Murray <timmurray@google.com>
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> 
> ...
> 
> > +/*
> > + * An implementation of an rwsem that is explicitly unfair to readers. This
> > + * prevents priority inversion when a low-priority reader acquires the read lock
> > + * while sleeping on the write lock but the write lock is needed by
> > + * higher-priority clients.
> > + */
> > +
> > +struct f2fs_rwsem {
> > +        struct rw_semaphore internal_rwsem;
> > +        wait_queue_head_t read_waiters;
> > +};
> 
> ...
> 
> > +static inline void f2fs_down_read(struct f2fs_rwsem *sem)
> > +{
> > +	wait_event(sem->read_waiters, down_read_trylock(&sem->internal_rwsem));
> > +}
> > +
> > +static inline int f2fs_down_read_trylock(struct f2fs_rwsem *sem)
> > +{
> > +	return down_read_trylock(&sem->internal_rwsem);
> > +}
> > +
> > +static inline void f2fs_up_read(struct f2fs_rwsem *sem)
> > +{
> > +	up_read(&sem->internal_rwsem);
> > +}
> > +
> > +static inline void f2fs_down_write(struct f2fs_rwsem *sem)
> > +{
> > +	down_write(&sem->internal_rwsem);
> > +}
> > +
> > +static inline int f2fs_down_write_trylock(struct f2fs_rwsem *sem)
> > +{
> > +	return down_write_trylock(&sem->internal_rwsem);
> > +}
> > +
> > +static inline void f2fs_up_write(struct f2fs_rwsem *sem)
> > +{
> > +	up_write(&sem->internal_rwsem);
> > +	wake_up_all(&sem->read_waiters);
> > +}
> > +
> 
> Here is my two cents, the unfair rwsem derived from lock_sock(), which has
> no link to rwsem.
> 
> Only for thoughts now.
> 
> Hillf
> 
> struct unfair_rwsem {
> 	spinlock_t 	lock;
> 	int 		owner; /* < 0 writer, > 0 readers */
> 
> 	struct list_head reader, writer; /* read/write waiters */
> 
> #ifdef CONFIG_DEBUG_LOCK_ALLOC
> 	struct lockdep_map dep_map;
> #endif
> };
> 
> struct unfair_rwsem_wait {
> 	struct list_head 	node;
> 	struct task_struct 	*task;
> };
> 
> static void lock_unfair_rwsem(struct unfair_rwsem *us, int read)
> {
> 	struct unfair_rwsem_wait wait;
> 
> 	mutex_acquire(&us->dep_map, 0, 0, _RET_IP_);
> 	might_sleep();
> 	wait.task = current;
> 	for (;;) {
> 		spin_lock(&us->lock);
> 		if (read) {
> 			if (us->owner >= 0) {
> 				us->owner++;
> 				spin_unlock(&us->lock);
> 				return;
> 			}
> 			list_add_tail(&wait.node, &us->reader);
> 		} else {
> 			if (us->owner == 0) {
> 				us->owner--;
> 				spin_unlock(&us->lock);
> 				return;
> 			}
> 			list_add_tail(&wait.node, &us->writer);
> 		}
> 		set_current_state(TASK_UNINTERRUPTIBLE);
> 		spin_unlock(&us->lock);
> 		schedule();
> 	}
> }
> 
> void down_read_unfair_rwsem(struct unfair_rwsem *us)
> {
> 	lock_unfair_rwsem(us, 1);
> }
> 
> void down_write_unfair_rwsem(struct unfair_rwsem *us)
> {
> 	lock_unfair_rwsem(us, 0);
> }
> 
> static void unlock_unfair_rwsem(struct unfair_rwsem *us, int read)
> {
> 	struct list_head *head = NULL;
> 	int all = 0;
> 
> 	spin_lock(&us->lock);
> 	if (us->owner < 0) {
> 		BUG_ON(read);
> 		us->owner++;
> 		BUG_ON(0 != us->owner);
> 
> 		if (!list_empty(&us->writer))
> 			head = &us->writer;
> 		else if (!list_empty(&us->reader)) {
> 			head = &us->reader;
> 			all = 1;
> 		}
> 	} else if (us->owner > 0) {
> 		BUG_ON(!read);
> 		BUG_ON(!list_empty(&us->reader));
> 		us->owner--;
> 		if (us->owner == 0)
> 			if (!list_empty(&us->writer))
> 				head = &us->writer;
> 	} else
> 		BUG_ON(1);
> 
> 	mutex_release(&us->dep_map, _RET_IP_);
> 	if (head) {
> 		struct unfair_rwsem_wait *wait;
> 		do {
> 			wait = list_first_entry(head, struct unfair_rwsem_wait, node);
> 			list_del(&wait->node);
> 			wake_up_process(wait->task);
> 		} while (all && !list_empty(head));
> 	}
> 	spin_unlock(&us->lock);
> }
> 
> void up_write_unfair_rwsem(struct unfair_rwsem *us)
> {
> 	unlock_unfair_rwsem(us, 0);
> }
> 
> void up_read_unfair_rwsem(struct unfair_rwsem *us)
> {
> 	unlock_unfair_rwsem(us, 1);
> }
> 

And make unfair rwsem more unfair by setting lock owner for write waiter,
in addition to prefering to wake up write waiter over read waiter.

Hillf

--- x/unfair_rwsem.c
+++ y/unfair_rwsem.c
@@ -42,6 +42,8 @@ static void lock_unfair_rwsem(struct unf
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		spin_unlock(&us->lock);
 		schedule();
+		if (!read)
+			return; /* because this is unfair rwsem */
 	}
 }
 
@@ -88,8 +90,15 @@ static void unlock_unfair_rwsem(struct u
 		do {
 			wait = list_first_entry(head, struct unfair_rwsem_wait, node);
 			list_del(&wait->node);
-			wake_up_process(wait->task);
-		} while (all && !list_empty(head));
+			if (all)
+				wake_up_process(wait->task);
+			else {
+				/* for the sake of unfairness */
+				us->owner = -1;
+				wake_up_process(wait->task);
+				break;
+			}
+		} while (!list_empty(head));
 	}
 	spin_unlock(&us->lock);
 }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
