Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DD6723994
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jun 2023 09:41:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6RK3-0003S5-8B;
	Tue, 06 Jun 2023 07:41:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+c7f58ba0a08136e81302+7226+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q6RK1-0003RV-G7 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 07:41:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vHcX3S2sl+pGbOZrjHP9HcCBLAMHPQWl4gmV2z7KfHE=; b=fdBZOSJfWVPvyR6XR6cue1ZnE5
 OFxmzbHibaoykzN0jQeQgS4UqbTb291FXtLpKxb9jgOAxZUhDhIGyq+qF/fwFOdBokRezJiuLJ80v
 w5Oe5/cfwszTOsbWfpDRHHRZ+lBYzmE3qo1H76rHw0wuzfonrmm1xUaIR8yqqQC2Qhug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vHcX3S2sl+pGbOZrjHP9HcCBLAMHPQWl4gmV2z7KfHE=; b=ZD4x78Xvpyx6jDbzcxjEmA5xOF
 vqWmvpfIQL+MEt4TMn71mefNHsRmw16aQAza6FzL2zAkmVFZm09AC01a37ZAuiu7o5zAMWfBzkaB2
 bzEj19lc50ZpsKKnUjmb8FSLShr+39Ifk7FrZiYNRzAsyknhm3islewCFgg8GuSYwB3s=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6RK1-00CVAK-0t for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 07:41:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=vHcX3S2sl+pGbOZrjHP9HcCBLAMHPQWl4gmV2z7KfHE=; b=drZ4wkQYmFnx901jMqvpeF3nQb
 5HYtfg7uUF6T0B2uem0mk7dHK6xJniRJRL+5zNPve8bw2exu+F4p14xF22QmJ20JGMKDCPEjWndq0
 fJsbbAkGTGGw1A+KXJlyH1Xg2WeumA3swMkzKOevMFuEgHORynqNWfXIKzrl0i6/uIyBjc1N+dfwr
 LObaDZT6tdF4Q+yNxdmbzauEwxdrQYJ0aT3yzCSteCnEmXVpf29wG7j0ZCfavTC4LlfEa7AaBxoEZ
 wOm7285ab9Y7SUMBmmEKGFf3TmKtHerGb+VQh0jYnPsKQDSf3pEA0ainVbBKGrvpcQb657LIr6dM8
 3UcOq7xg==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q6RJR-000Zlq-1O; Tue, 06 Jun 2023 07:41:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue,  6 Jun 2023 09:39:41 +0200
Message-Id: <20230606073950.225178-23-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230606073950.225178-1-hch@lst.de>
References: <20230606073950.225178-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Instead of passing a fmode_t and only checking it fo0r
 FMODE_WRITE, 
 pass a bool open_for_write to prepare for callers that won't have the fmode_t.
 Signed-off-by: Christoph Hellwig <hch@lst.de> --- drivers/nvme/host/ioctl.c
 | 62 +++++++++++++++++++++ 1 file changed, 34 insertions(+), 28 deletions(-)
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q6RK1-00CVAK-0t
Subject: [f2fs-dev] [PATCH 22/31] nvme: replace the fmode_t argument to the
 nvme ioctl handlers with a simple bool
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-nvme@lists.infradead.org,
 Phillip Potter <phil@philpotter.co.uk>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jack Wang <jinpu.wang@ionos.com>, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Christian Brauner <brauner@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Instead of passing a fmode_t and only checking it fo0r FMODE_WRITE, pass
a bool open_for_write to prepare for callers that won't have the fmode_t.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/ioctl.c | 62 +++++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/drivers/nvme/host/ioctl.c b/drivers/nvme/host/ioctl.c
index 81c5c9e3847747..8bf09047348ee9 100644
--- a/drivers/nvme/host/ioctl.c
+++ b/drivers/nvme/host/ioctl.c
@@ -14,7 +14,7 @@ enum {
 };
 
 static bool nvme_cmd_allowed(struct nvme_ns *ns, struct nvme_command *c,
-		unsigned int flags, fmode_t mode)
+		unsigned int flags, bool open_for_write)
 {
 	u32 effects;
 
@@ -80,7 +80,7 @@ static bool nvme_cmd_allowed(struct nvme_ns *ns, struct nvme_command *c,
 	 * writing.
 	 */
 	if (nvme_is_write(c) || (effects & NVME_CMD_EFFECTS_LBCC))
-		return mode & FMODE_WRITE;
+		return open_for_write;
 	return true;
 }
 
@@ -337,7 +337,7 @@ static bool nvme_validate_passthru_nsid(struct nvme_ctrl *ctrl,
 
 static int nvme_user_cmd(struct nvme_ctrl *ctrl, struct nvme_ns *ns,
 		struct nvme_passthru_cmd __user *ucmd, unsigned int flags,
-		fmode_t mode)
+		bool open_for_write)
 {
 	struct nvme_passthru_cmd cmd;
 	struct nvme_command c;
@@ -365,7 +365,7 @@ static int nvme_user_cmd(struct nvme_ctrl *ctrl, struct nvme_ns *ns,
 	c.common.cdw14 = cpu_to_le32(cmd.cdw14);
 	c.common.cdw15 = cpu_to_le32(cmd.cdw15);
 
-	if (!nvme_cmd_allowed(ns, &c, 0, mode))
+	if (!nvme_cmd_allowed(ns, &c, 0, open_for_write))
 		return -EACCES;
 
 	if (cmd.timeout_ms)
@@ -385,7 +385,7 @@ static int nvme_user_cmd(struct nvme_ctrl *ctrl, struct nvme_ns *ns,
 
 static int nvme_user_cmd64(struct nvme_ctrl *ctrl, struct nvme_ns *ns,
 		struct nvme_passthru_cmd64 __user *ucmd, unsigned int flags,
-		fmode_t mode)
+		bool open_for_write)
 {
 	struct nvme_passthru_cmd64 cmd;
 	struct nvme_command c;
@@ -412,7 +412,7 @@ static int nvme_user_cmd64(struct nvme_ctrl *ctrl, struct nvme_ns *ns,
 	c.common.cdw14 = cpu_to_le32(cmd.cdw14);
 	c.common.cdw15 = cpu_to_le32(cmd.cdw15);
 
-	if (!nvme_cmd_allowed(ns, &c, flags, mode))
+	if (!nvme_cmd_allowed(ns, &c, flags, open_for_write))
 		return -EACCES;
 
 	if (cmd.timeout_ms)
@@ -583,7 +583,7 @@ static int nvme_uring_cmd_io(struct nvme_ctrl *ctrl, struct nvme_ns *ns,
 	c.common.cdw14 = cpu_to_le32(READ_ONCE(cmd->cdw14));
 	c.common.cdw15 = cpu_to_le32(READ_ONCE(cmd->cdw15));
 
-	if (!nvme_cmd_allowed(ns, &c, 0, ioucmd->file->f_mode))
+	if (!nvme_cmd_allowed(ns, &c, 0, ioucmd->file->f_mode & FMODE_WRITE))
 		return -EACCES;
 
 	d.metadata = READ_ONCE(cmd->metadata);
@@ -649,13 +649,13 @@ static bool is_ctrl_ioctl(unsigned int cmd)
 }
 
 static int nvme_ctrl_ioctl(struct nvme_ctrl *ctrl, unsigned int cmd,
-		void __user *argp, fmode_t mode)
+		void __user *argp, bool open_for_write)
 {
 	switch (cmd) {
 	case NVME_IOCTL_ADMIN_CMD:
-		return nvme_user_cmd(ctrl, NULL, argp, 0, mode);
+		return nvme_user_cmd(ctrl, NULL, argp, 0, open_for_write);
 	case NVME_IOCTL_ADMIN64_CMD:
-		return nvme_user_cmd64(ctrl, NULL, argp, 0, mode);
+		return nvme_user_cmd64(ctrl, NULL, argp, 0, open_for_write);
 	default:
 		return sed_ioctl(ctrl->opal_dev, cmd, argp);
 	}
@@ -680,14 +680,14 @@ struct nvme_user_io32 {
 #endif /* COMPAT_FOR_U64_ALIGNMENT */
 
 static int nvme_ns_ioctl(struct nvme_ns *ns, unsigned int cmd,
-		void __user *argp, unsigned int flags, fmode_t mode)
+		void __user *argp, unsigned int flags, bool open_for_write)
 {
 	switch (cmd) {
 	case NVME_IOCTL_ID:
 		force_successful_syscall_return();
 		return ns->head->ns_id;
 	case NVME_IOCTL_IO_CMD:
-		return nvme_user_cmd(ns->ctrl, ns, argp, flags, mode);
+		return nvme_user_cmd(ns->ctrl, ns, argp, flags, open_for_write);
 	/*
 	 * struct nvme_user_io can have different padding on some 32-bit ABIs.
 	 * Just accept the compat version as all fields that are used are the
@@ -702,7 +702,8 @@ static int nvme_ns_ioctl(struct nvme_ns *ns, unsigned int cmd,
 		flags |= NVME_IOCTL_VEC;
 		fallthrough;
 	case NVME_IOCTL_IO64_CMD:
-		return nvme_user_cmd64(ns->ctrl, ns, argp, flags, mode);
+		return nvme_user_cmd64(ns->ctrl, ns, argp, flags,
+				       open_for_write);
 	default:
 		return -ENOTTY;
 	}
@@ -712,6 +713,7 @@ int nvme_ioctl(struct block_device *bdev, fmode_t mode,
 		unsigned int cmd, unsigned long arg)
 {
 	struct nvme_ns *ns = bdev->bd_disk->private_data;
+	bool open_for_write = mode & FMODE_WRITE;
 	void __user *argp = (void __user *)arg;
 	unsigned int flags = 0;
 
@@ -719,19 +721,20 @@ int nvme_ioctl(struct block_device *bdev, fmode_t mode,
 		flags |= NVME_IOCTL_PARTITION;
 
 	if (is_ctrl_ioctl(cmd))
-		return nvme_ctrl_ioctl(ns->ctrl, cmd, argp, mode);
-	return nvme_ns_ioctl(ns, cmd, argp, flags, mode);
+		return nvme_ctrl_ioctl(ns->ctrl, cmd, argp, open_for_write);
+	return nvme_ns_ioctl(ns, cmd, argp, flags, open_for_write);
 }
 
 long nvme_ns_chr_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	struct nvme_ns *ns =
 		container_of(file_inode(file)->i_cdev, struct nvme_ns, cdev);
+	bool open_for_write = file->f_mode & FMODE_WRITE;
 	void __user *argp = (void __user *)arg;
 
 	if (is_ctrl_ioctl(cmd))
-		return nvme_ctrl_ioctl(ns->ctrl, cmd, argp, file->f_mode);
-	return nvme_ns_ioctl(ns, cmd, argp, 0, file->f_mode);
+		return nvme_ctrl_ioctl(ns->ctrl, cmd, argp, open_for_write);
+	return nvme_ns_ioctl(ns, cmd, argp, 0, open_for_write);
 }
 
 static int nvme_uring_cmd_checks(unsigned int issue_flags)
@@ -800,7 +803,7 @@ int nvme_ns_chr_uring_cmd_iopoll(struct io_uring_cmd *ioucmd,
 #ifdef CONFIG_NVME_MULTIPATH
 static int nvme_ns_head_ctrl_ioctl(struct nvme_ns *ns, unsigned int cmd,
 		void __user *argp, struct nvme_ns_head *head, int srcu_idx,
-		fmode_t mode)
+		bool open_for_write)
 	__releases(&head->srcu)
 {
 	struct nvme_ctrl *ctrl = ns->ctrl;
@@ -808,7 +811,7 @@ static int nvme_ns_head_ctrl_ioctl(struct nvme_ns *ns, unsigned int cmd,
 
 	nvme_get_ctrl(ns->ctrl);
 	srcu_read_unlock(&head->srcu, srcu_idx);
-	ret = nvme_ctrl_ioctl(ns->ctrl, cmd, argp, mode);
+	ret = nvme_ctrl_ioctl(ns->ctrl, cmd, argp, open_for_write);
 
 	nvme_put_ctrl(ctrl);
 	return ret;
@@ -818,6 +821,7 @@ int nvme_ns_head_ioctl(struct block_device *bdev, fmode_t mode,
 		unsigned int cmd, unsigned long arg)
 {
 	struct nvme_ns_head *head = bdev->bd_disk->private_data;
+	bool open_for_write = mode & FMODE_WRITE;
 	void __user *argp = (void __user *)arg;
 	struct nvme_ns *ns;
 	int srcu_idx, ret = -EWOULDBLOCK;
@@ -838,9 +842,9 @@ int nvme_ns_head_ioctl(struct block_device *bdev, fmode_t mode,
 	 */
 	if (is_ctrl_ioctl(cmd))
 		return nvme_ns_head_ctrl_ioctl(ns, cmd, argp, head, srcu_idx,
-					mode);
+					       open_for_write);
 
-	ret = nvme_ns_ioctl(ns, cmd, argp, flags, mode);
+	ret = nvme_ns_ioctl(ns, cmd, argp, flags, open_for_write);
 out_unlock:
 	srcu_read_unlock(&head->srcu, srcu_idx);
 	return ret;
@@ -849,6 +853,7 @@ int nvme_ns_head_ioctl(struct block_device *bdev, fmode_t mode,
 long nvme_ns_head_chr_ioctl(struct file *file, unsigned int cmd,
 		unsigned long arg)
 {
+	bool open_for_write = file->f_mode & FMODE_WRITE;
 	struct cdev *cdev = file_inode(file)->i_cdev;
 	struct nvme_ns_head *head =
 		container_of(cdev, struct nvme_ns_head, cdev);
@@ -863,9 +868,9 @@ long nvme_ns_head_chr_ioctl(struct file *file, unsigned int cmd,
 
 	if (is_ctrl_ioctl(cmd))
 		return nvme_ns_head_ctrl_ioctl(ns, cmd, argp, head, srcu_idx,
-				file->f_mode);
+				open_for_write);
 
-	ret = nvme_ns_ioctl(ns, cmd, argp, 0, file->f_mode);
+	ret = nvme_ns_ioctl(ns, cmd, argp, 0, open_for_write);
 out_unlock:
 	srcu_read_unlock(&head->srcu, srcu_idx);
 	return ret;
@@ -940,7 +945,7 @@ int nvme_dev_uring_cmd(struct io_uring_cmd *ioucmd, unsigned int issue_flags)
 }
 
 static int nvme_dev_user_cmd(struct nvme_ctrl *ctrl, void __user *argp,
-		fmode_t mode)
+		bool open_for_write)
 {
 	struct nvme_ns *ns;
 	int ret;
@@ -964,7 +969,7 @@ static int nvme_dev_user_cmd(struct nvme_ctrl *ctrl, void __user *argp,
 	kref_get(&ns->kref);
 	up_read(&ctrl->namespaces_rwsem);
 
-	ret = nvme_user_cmd(ctrl, ns, argp, 0, mode);
+	ret = nvme_user_cmd(ctrl, ns, argp, 0, open_for_write);
 	nvme_put_ns(ns);
 	return ret;
 
@@ -976,16 +981,17 @@ static int nvme_dev_user_cmd(struct nvme_ctrl *ctrl, void __user *argp,
 long nvme_dev_ioctl(struct file *file, unsigned int cmd,
 		unsigned long arg)
 {
+	bool open_for_write = file->f_mode & FMODE_WRITE;
 	struct nvme_ctrl *ctrl = file->private_data;
 	void __user *argp = (void __user *)arg;
 
 	switch (cmd) {
 	case NVME_IOCTL_ADMIN_CMD:
-		return nvme_user_cmd(ctrl, NULL, argp, 0, file->f_mode);
+		return nvme_user_cmd(ctrl, NULL, argp, 0, open_for_write);
 	case NVME_IOCTL_ADMIN64_CMD:
-		return nvme_user_cmd64(ctrl, NULL, argp, 0, file->f_mode);
+		return nvme_user_cmd64(ctrl, NULL, argp, 0, open_for_write);
 	case NVME_IOCTL_IO_CMD:
-		return nvme_dev_user_cmd(ctrl, argp, file->f_mode);
+		return nvme_dev_user_cmd(ctrl, argp, open_for_write);
 	case NVME_IOCTL_RESET:
 		if (!capable(CAP_SYS_ADMIN))
 			return -EACCES;
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
