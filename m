Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A9591D976
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2024 09:53:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sOBqc-00049A-C9;
	Mon, 01 Jul 2024 07:53:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Yi.Sun@unisoc.com>) id 1sOBqb-000494-0N
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Jul 2024 07:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qMppuDI1wnvEIsKQBj9vDotqx3IBKuxAM1cbtDDXvG0=; b=JXSKd0Kh6mbbD7aEnX82Qg937n
 0/ChV/z/neAv0YemjdG4/fBN1BPoxMSq5WQF9yAX9ZUgwdrarxPIoKnHqRJhtORn5CV3dtwPhFFAI
 sm1xjh8AAb2lK9UQyxPPLRu5mkePcyktsbHUyM4nA+ogjxx/kxWLkgDxS9q+cZxiTRxA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qMppuDI1wnvEIsKQBj9vDotqx3IBKuxAM1cbtDDXvG0=; b=UBPGflBmeI9qdddqEtcwHOh8pF
 FySa+VHAUFR8RB88S6AaQHI1IPuf7cdlN5vLrIgmMLRBcg7ZrAv82VrnSbVpS6hlVZVZnRiwTERNZ
 5xVC7DmzpyBA3+K1JUmjBmpUqWznzCMOl1Hmjxn1US7FKBPspZZpIfQPosYJhsgamc4g=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sOBqZ-0006v4-Rj for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Jul 2024 07:53:12 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 4617pill064601;
 Mon, 1 Jul 2024 15:51:44 +0800 (+08)
 (envelope-from Yi.Sun@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4WCJ5l68MFz2KQ9Qx;
 Mon,  1 Jul 2024 15:46:51 +0800 (CST)
Received: from tj10379pcu.spreadtrum.com (10.5.32.15) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 1 Jul 2024 15:51:41 +0800
From: Yi Sun <yi.sun@unisoc.com>
To: <sunyibuaa@gmail.com>, <tj@kernel.org>, <jiangshanlai@gmail.com>,
 <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 1 Jul 2024 15:51:37 +0800
Message-ID: <20240701075138.1144575-2-yi.sun@unisoc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240701075138.1144575-1-yi.sun@unisoc.com>
References: <20240701075138.1144575-1-yi.sun@unisoc.com>
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 4617pill064601
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Many works will go to submit_bio(), and in many cases the
 io priority of kworker cannot meet the real-time requirements of this work.
 So create a new struct io_work, which contains the io priority that the kworker
 thread can adjust its own io priority according to. 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [222.66.158.135 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1sOBqZ-0006v4-Rj
Subject: [f2fs-dev] [PATCH v2 1/2] workqueue: new struct io_work
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
Cc: yunlongxing23@gmail.com, ebiggers@google.com, kent.overstreet@linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 yi.sun@unisoc.com, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Many works will go to submit_bio(), and in many cases the io priority
of kworker cannot meet the real-time requirements of this work.

So create a new struct io_work, which contains the io priority that
the kworker thread can adjust its own io priority according to.

And,
new function set_io_work_ioprio() to set the io priority of io work,
new function may_adjust_io_work_task_ioprio() to adjust kworker's io
priority,
new function restore_io_work_task_ioprio() to restore kworker's io
priority.

Signed-off-by: Yi Sun <yi.sun@unisoc.com>
---
 include/linux/workqueue.h | 47 ++++++++++++++++++++++++++++++++++++
 kernel/workqueue.c        | 50 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index d9968bfc8eac..4b2cb54a68b2 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -127,6 +127,21 @@ struct rcu_work {
 	struct workqueue_struct *wq;
 };
 
+/*
+ * If a work may do disk IO, it is recommended to use struct io_work
+ * instead of struct work_struct.
+ */
+struct io_work {
+	struct work_struct work;
+
+	/* If the work does submit_bio, io priority may be needed. */
+	unsigned short ioprio;
+	/* Record kworker's original io priority. */
+	unsigned short ori_ioprio;
+	/* Whether the work has set io priority? */
+	long ioprio_flag;
+};
+
 enum wq_affn_scope {
 	WQ_AFFN_DFL,			/* use system default */
 	WQ_AFFN_CPU,			/* one pod per CPU */
@@ -218,6 +233,11 @@ static inline struct rcu_work *to_rcu_work(struct work_struct *work)
 	return container_of(work, struct rcu_work, work);
 }
 
+static inline struct io_work *to_io_work(struct work_struct *work)
+{
+	return container_of(work, struct io_work, work);
+}
+
 struct execute_work {
 	struct work_struct work;
 };
@@ -347,6 +367,18 @@ static inline unsigned int work_static(struct work_struct *work) { return 0; }
 #define INIT_RCU_WORK_ONSTACK(_work, _func)				\
 	INIT_WORK_ONSTACK(&(_work)->work, (_func))
 
+#define INIT_IO_WORK(_work, _func)					\
+	do {								\
+		INIT_WORK(&(_work)->work, (_func));			\
+		(_work)->ioprio_flag = 0;				\
+	} while (0)
+
+#define INIT_IO_WORK_ONSTACK(_work, _func)				\
+	do {								\
+		INIT_WORK_ONSTACK(&(_work)->work, (_func));		\
+		(_work)->ioprio_flag = 0;				\
+	} while (0)
+
 /**
  * work_pending - Find out whether a work item is currently pending
  * @work: The work item in question
@@ -552,6 +584,10 @@ extern bool mod_delayed_work_on(int cpu, struct workqueue_struct *wq,
 			struct delayed_work *dwork, unsigned long delay);
 extern bool queue_rcu_work(struct workqueue_struct *wq, struct rcu_work *rwork);
 
+extern void set_io_work_ioprio(struct io_work *work, unsigned short ioprio);
+extern void may_adjust_io_work_task_ioprio(struct io_work *work);
+extern void restore_io_work_task_ioprio(struct io_work *work);
+
 extern void __flush_workqueue(struct workqueue_struct *wq);
 extern void drain_workqueue(struct workqueue_struct *wq);
 
@@ -636,6 +672,17 @@ static inline bool queue_delayed_work(struct workqueue_struct *wq,
 	return queue_delayed_work_on(WORK_CPU_UNBOUND, wq, dwork, delay);
 }
 
+/**
+ * queue_io_work - queue io work on a workqueue
+ * @wq: workqueue to use
+ * @iowork: io work to queue
+ */
+static inline bool queue_io_work(struct workqueue_struct *wq,
+				      struct io_work *iowork)
+{
+	return queue_work(wq, &(iowork->work));
+}
+
 /**
  * mod_delayed_work - modify delay of or queue a delayed work
  * @wq: workqueue to use
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 3fbaecfc88c2..a55b74d5f560 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -2652,6 +2652,56 @@ bool queue_rcu_work(struct workqueue_struct *wq, struct rcu_work *rwork)
 }
 EXPORT_SYMBOL(queue_rcu_work);
 
+/**
+ * set_io_work_ioprio - set io priority for the current io work
+ * @iowork: the io work to be set
+ * @ioprio: desired io priority
+ *
+ * This function can be called after INIT_IO_WORK if the io priority
+ * of the io work needs to adjust. And it is recommended to use this
+ * function together with may_adjust_io_work_task_ioprio() and
+ * restore_io_work_task_ioprio().
+ */
+void set_io_work_ioprio(struct io_work *iowork, unsigned short ioprio)
+{
+	iowork->ioprio = ioprio;
+	iowork->ioprio_flag = 1;
+}
+EXPORT_SYMBOL(set_io_work_ioprio);
+
+/**
+ * may_adjust_io_work_task_ioprio - maybe adjust the io priority of kworker
+ * @iowork: the io work that kworker will do
+ *
+ * It is recommended to use this function together with set_io_work_ioprio()
+ * and restore_io_work_task_ioprio().
+ */
+void may_adjust_io_work_task_ioprio(struct io_work *iowork)
+{
+	if (iowork->ioprio_flag) {
+		iowork->ori_ioprio = get_current_ioprio();
+		set_task_ioprio(current, iowork->ioprio);
+	}
+}
+EXPORT_SYMBOL(may_adjust_io_work_task_ioprio);
+
+/**
+ * restore_io_work_task_ioprio - restore the io priority of kworker
+ * @iowork: the io work that kworker just did
+ *
+ * When kworker finishes the io work, the original io priority of
+ * kworker should be restored. It is recommended to use this function
+ * together with set_io_work_ioprio() and may_adjust_io_work_task_ioprio().
+ */
+void restore_io_work_task_ioprio(struct io_work *iowork)
+{
+	if (iowork->ioprio_flag) {
+		set_task_ioprio(current, iowork->ori_ioprio);
+		iowork->ioprio_flag = 0;
+	}
+}
+EXPORT_SYMBOL(restore_io_work_task_ioprio);
+
 static struct worker *alloc_worker(int node)
 {
 	struct worker *worker;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
