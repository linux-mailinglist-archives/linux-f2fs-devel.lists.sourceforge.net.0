Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A38ECC12D1
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Sep 2019 04:22:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iEOr6-0006hM-6v; Sun, 29 Sep 2019 02:22:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gaoxiang25@huawei.com>) id 1iEOr2-0006gl-L1
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 29 Sep 2019 02:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mU1lxLL38bTOMszBa+m3xb9Cd6uAP41dilWEjB0MRVc=; b=AHrZYDMADMhZvQOoYCwpdh08Y4
 voFmxsayDJgz4npXT+tP/i3LIAT7Ur3CgbYCP5/U5+U/gbswnNUx3B7F02H85G+6eIekEopyHoKyy
 i81kInWowo8VfV/jmj/XjyFEMrUrj16e4/DSy+8Rky15hcRNI5Km40rIG5btXPSesrxA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mU1lxLL38bTOMszBa+m3xb9Cd6uAP41dilWEjB0MRVc=; b=KBuxPjQ5XYKOFRboY2U/zxgCIy
 2TSkFhfSwXoxpjNTZOGvwFbVFyMW5/c1T4sYPeU0yA3THHEdm80KEAd4aTqlqHcXiv2OO4P2B4ZXq
 ftYeYIVdXTurd6WZgunuW/lTFY2gjqaL35dQUhjq/eLo0LBd2Ho57a5RJqqt8/frH+gM=;
Received: from szxga03-in.huawei.com ([45.249.212.189] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iEOqy-00ADVC-Mq
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 29 Sep 2019 02:22:31 +0000
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id 81C8489247855DFBD3EF;
 Sun, 29 Sep 2019 10:22:21 +0800 (CST)
Received: from dggeme762-chm.china.huawei.com (10.3.19.108) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 29 Sep 2019 10:22:21 +0800
Received: from architecture4 (10.140.130.215) by
 dggeme762-chm.china.huawei.com (10.3.19.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Sun, 29 Sep 2019 10:22:11 +0800
Date: Sun, 29 Sep 2019 10:20:52 +0800
From: Gao Xiang <gaoxiang25@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Message-ID: <20190929021939.GA136917@architecture4>
References: <20190925093050.118921-1-yuchao0@huawei.com>
 <20190927183150.GA54001@jaegeuk-macbookpro.roam.corp.google.com>
 <8c54adaf-163f-fcbe-7731-0c18b12410e0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c54adaf-163f-fcbe-7731-0c18b12410e0@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.140.130.215]
X-ClientProxiedBy: dggeme701-chm.china.huawei.com (10.1.199.97) To
 dggeme762-chm.china.huawei.com (10.3.19.108)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iEOqy-00ADVC-Mq
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix comment of f2fs_evict_inode
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Sep 29, 2019 at 08:53:05AM +0800, Chao Yu wrote:
> Hi Jaegeuk,
> 
> On 2019/9/28 2:31, Jaegeuk Kim wrote:
> > Hi Chao,
> > 
> > On 09/25, Chao Yu wrote:
> >> evict() should be called once i_count is zero, rather than i_nlinke
> >> is zero.
> >>
> >> Reported-by: Gao Xiang <gaoxiang25@huawei.com>
> >> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> >> ---
> >>  fs/f2fs/inode.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> >> index db4fec30c30d..8262f4a483d3 100644
> >> --- a/fs/f2fs/inode.c
> >> +++ b/fs/f2fs/inode.c
> >> @@ -632,7 +632,7 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
> >>  }
> >>  
> >>  /*
> >> - * Called at the last iput() if i_nlink is zero
> > 
> > I don't think this comment is wrong. You may be able to add on top of this.
> 
> It actually misleads the developer or user.
> 
> How do you think of:
> 
> "Called at the last iput() if i_count is zero, and will release all meta/data
> blocks allocated in the inode if i_nlink is zero"

(sigh... side note: I just took some time to check the original meaning
 out of curiosity. AFAIK, the above word was added in Linux-2.1.45 [1]
 due to ext2_delete_inode behavior, which is called when i_nlink == 0,
 and .delete_inode was gone in 2010 (commit 72edc4d0873b merge ext2
 delete_inode and clear_inode, switch to ->evict_inode()), it may be
 helpful to understand the story so I write here for later folks reference.
 And it's also good to just kill it. )

+
+/*
+ * Called at the last iput() if i_nlink is zero.
+ */
+void ext2_delete_inode (struct inode * inode)
+{
+	if (inode->i_ino == EXT2_ACL_IDX_INO ||
 	    inode->i_ino == EXT2_ACL_DATA_INO)
 		return;
 	inode->u.ext2_i.i_dtime	= CURRENT_TIME;
-	inode->i_dirt = 1;
+	mark_inode_dirty(inode);
 	ext2_update_inode(inode, IS_SYNC(inode));
 	inode->i_size = 0;
 	if (inode->i_blocks)
@@ -248,7 +258,7 @@
 	if (IS_SYNC(inode) || inode->u.ext2_i.i_osync)
 		ext2_sync_inode (inode);
 	else
-		inode->i_dirt = 1;
+		mark_inode_dirty(inode);
 	return result;
 }

+void iput(struct inode *inode)
 {
-	struct inode * inode = get_empty_inode();
+	if (inode) {
+		struct super_operations *op = NULL;
 
-	PIPE_BASE(*inode) = (char*)__get_free_page(GFP_USER);
-	if (!(PIPE_BASE(*inode))) {
-		iput(inode);
-		return NULL;
+		if (inode->i_sb && inode->i_sb->s_op)
+			op = inode->i_sb->s_op;
+		if (op && op->put_inode)
+			op->put_inode(inode);
+
+		spin_lock(&inode_lock);
+		if (!--inode->i_count) {
+			if (!inode->i_nlink) {
+				list_del(&inode->i_hash);
+				INIT_LIST_HEAD(&inode->i_hash);
+				if (op && op->delete_inode) {
+					void (*delete)(struct inode *) = op->delete_inode;
+					spin_unlock(&inode_lock);
+					delete(inode);
+					spin_lock(&inode_lock);
+				}
+			}
+			if (list_empty(&inode->i_hash)) {
+				list_del(&inode->i_list);
+				list_add(&inode->i_list, &inode_unused);
+			}
+		}
+		spin_unlock(&inode_lock);
 	}

[1] https://www.kernel.org/pub/linux/kernel/v2.1/patch-2.1.45.xz

Thanks,
Gao Xiang

> 
> Thanks,
> 
> > 
> >> + * Called at the last iput() if i_count is zero
> >>   */
> >>  void f2fs_evict_inode(struct inode *inode)
> >>  {
> >> -- 
> >> 2.18.0.rc1
> > .
> > 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
