Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AFD200026
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2020 04:21:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:In-Reply-To:
	References:To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZILLs09CpsvqrhUXW8Qa2Osu/wGmzS+aX+Mobel6gRE=; b=T80160H3TLQrHSqxr6xGkbroI1
	V1DgF/bGxyS34yhVUTcomcqDVtMhHjwSO8gMWoLmf2kuPbvbeG3HalIwl7GuMfNQEz94eWSyH/fI9
	VqiCUEZl9N76V/D54Y4V+HatfJCIBlEsYq3Cg2rbpYOk9Ra04cfO0ruvXVopP+yA8sjc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jm6ei-0006So-W7; Fri, 19 Jun 2020 02:21:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <zhaowuyun@wingtech.com>) id 1jm6eh-0006Sc-LH
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 02:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FuaBSGjArEM462JpNiI9C1xyN9l4ipJxBnksGnsEOck=; b=VEml77pXcp2RUPbaAcA/QZb1xq
 J5ATvHQ5/MF9n4Q69X24BVDdVZIGg53BKenXkXXiuBW8rX+WThDbZhv6IVTRWcnI0QSZGb/uEi19R
 NjAmI5SR/K3zTF9/Ea67G3ZFBCHJRBN3boLqBNNfR8XI1IAD2CkY870XD8VJ/i264bwg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FuaBSGjArEM462JpNiI9C1xyN9l4ipJxBnksGnsEOck=; b=MgQU7PsKHROMqw7stTYDf1e24z
 KQhcvRhHhQ2SPkr99cG458MAo9v8N84X6rdHpD96UQXP38BlHeCVaKKM/eDY+oyTS8HnNezhoEHxq
 NYhhjvU0C5ogmscsWJXF5fUhghSx149Z3dx7KsOtdBrcnPl/wlrN76Sj6Op7i5SdjufU=;
Received: from mx.wingtech.com ([180.166.216.14] helo=mail.wingtech.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA:256) (Exim 4.92.2) id 1jm6ef-009Pjv-GM
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 02:21:23 +0000
Received: from mx.wingtech.com ([192.168.2.43])
 by mail.wingtech.com  with SMTP id 05J2L87p011291-05J2L87q011291
 for <linux-f2fs-devel@lists.sourceforge.net>; Fri, 19 Jun 2020 10:21:08 +0800
Received: from 192.168.51.143 (HELO ZHAOWUYUN); Fri, 19 Jun 2020 10:21:05 +0800
To: "'Chao Yu'" <yuchao0@huawei.com>, <jaegeuk@kernel.org>
References: <1592484487-12072-1-git-send-email-zhaowuyun@wingtech.com>
 <4a2d19c4-1ede-0172-fe50-c8464ee341df@huawei.com>
In-Reply-To: <4a2d19c4-1ede-0172-fe50-c8464ee341df@huawei.com>
Date: Fri, 19 Jun 2020 10:21:07 +0800
Message-ID: <000001d645e0$4aa645d0$dff2d170$@wingtech.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQF0xRpWUfEou3rvdx9uok8+PtRkbQEd45q7qZlDPFA=
Content-Language: zh-cn
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wingtech.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1jm6ef-009Pjv-GM
Subject: [f2fs-dev] =?gb2312?b?u9i4tDogW1BBVENIXSBmMmZzLXRvb2xzOiBzZXQg?=
	=?gb2312?b?Y29sZCBmbGFnIGZvciBub24tZGlyIG5vZGU=?=
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
From: Zac via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zac <zhaowuyun@wingtech.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> On 2020/6/18 20:48, zhaowuyun@wingtech.com wrote:
> > From: Wuyun Zhao <zhaowuyun@wingtech.com>
> 
> Thanks for the patch. :)
> 
> Please add commit message here.

OK

> >
> > Signed-off-by: Wuyun Zhao <zhaowuyun@wingtech.com>
> > ---
> >  fsck/dir.c  |  1 +
> >  fsck/node.c |  1 +
> >  fsck/node.h | 11 +++++++++++
> >  3 files changed, 13 insertions(+)
> >
> > diff --git a/fsck/dir.c b/fsck/dir.c
> > index 5f4f75e..dc03c98 100644
> > --- a/fsck/dir.c
> > +++ b/fsck/dir.c
> > @@ -522,6 +522,7 @@ static void init_inode_block(struct f2fs_sb_info
> *sbi,
> >  	node_blk->footer.nid = cpu_to_le32(de->ino);
> >  	node_blk->footer.flag = 0;
> >  	node_blk->footer.cp_ver = ckpt->checkpoint_ver;
> > +	set_cold_node(node_blk, S_ISDIR(mode));
> >
> >  	if (S_ISDIR(mode)) {
> >  		make_empty_dir(sbi, node_blk);
> > diff --git a/fsck/node.c b/fsck/node.c
> > index 229a99c..1d291ca 100644
> > --- a/fsck/node.c
> > +++ b/fsck/node.c
> > @@ -79,6 +79,7 @@ block_t new_node_block(struct f2fs_sb_info *sbi,
> >  	node_blk->footer.ino = f2fs_inode->footer.ino;
> >  	node_blk->footer.flag = cpu_to_le32(ofs << OFFSET_BIT_SHIFT);
> >  	node_blk->footer.cp_ver = ckpt->checkpoint_ver;
> > +	set_cold_node(node_blk, S_ISDIR(le16_to_cpu(f2fs_inode->i.i_mode)));
> 
> How about wrapping these node footer fields assignment into a function?
> then
> we can reuse this in other places.
> 
> void set_node_footer(nid, ino, ofs, ver, is_dir)
> {
> 	node_blk->footer.nid = cpu_to_le32(nid);
> 	node_blk->footer.ino = f2fs_inode->footer.ino;
> 	node_blk->footer.flag = cpu_to_le32(ofs << OFFSET_BIT_SHIFT);
> 	node_blk->footer.cp_ver = ckpt->checkpoint_ver;
> 	set_cold_node(node_blk, S_ISDIR(le16_to_cpu(f2fs_inode->i.i_mode)));
> }

Ok, That's good.

> >
> >  	type = CURSEG_COLD_NODE;
> >  	if (IS_DNODE(node_blk)) {
> > diff --git a/fsck/node.h b/fsck/node.h
> > index 6bce1fb..99139b1 100644
> > --- a/fsck/node.h
> > +++ b/fsck/node.h
> > @@ -161,6 +161,17 @@ static inline int is_node(struct f2fs_node
> *node_blk, int type)
> >  	return le32_to_cpu(node_blk->footer.flag) & (1 << type);
> >  }
> 
> Beside this, I think we need to use set_node_footer() in:
> - f2fs_write_root_inode
> - f2fs_write_qf_inode
> - f2fs_write_lpf_inode
> 
> as well to fix mkfs bugs.

the root inode and the lpf inode is dir, need to set cold flag? 

> Thanks,
> 
> >
> > +static inline void set_cold_node(struct f2fs_node *rn, bool is_dir)
> > +{
> > +	unsigned int flag = le32_to_cpu(rn->footer.flag);
> > +
> > +	if (is_dir)
> > +		flag &= ~(0x1 << COLD_BIT_SHIFT);
> > +	else
> > +		flag |= (0x1 << COLD_BIT_SHIFT);
> > +	rn->footer.flag = cpu_to_le32(flag);
> > +}
> > +
> >  #define is_fsync_dnode(node_blk)	is_node(node_blk, FSYNC_BIT_SHIFT)
> >  #define is_dent_dnode(node_blk)		is_node(node_blk,
> DENT_BIT_SHIFT)
> >
> >



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
