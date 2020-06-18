Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 388151FEE78
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 11:19:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlqhr-0004Wd-RZ; Thu, 18 Jun 2020 09:19:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jlqhq-0004WI-ED
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 09:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NmxmwlRnHX6RK55wpECprS9NxkkOyDKWN1skmG52fPo=; b=XD3pUc0NMGXGwruxRBumD2sgYB
 wzTZ/1Dl2SgBbEDOEuW2j99bm2dKMS/95A0/e9J01AW2WnAPcciv4ExsrP/cGsONWofc8ql6fceu1
 5FYpziioazGwHnScx7Tm7Bah4U3h6L1jOpmg64czoybOPcMF6UJzT9M2CojBi9ljavOw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NmxmwlRnHX6RK55wpECprS9NxkkOyDKWN1skmG52fPo=; b=HDqRUxc4ZN9NKVMoNTlD2jRkQl
 Ehl2JhqPRuqIeJZknWpkDD3Qb+TC24STqmXM2U/kqeAYumtOBhbySPLLzhnvHOwG9Mze7tgtpP8Tg
 rE3/9RB1n8dbKABbJypjnFWR6BsxHqJKSw+wxlzHJ5wfiZTmz446Sz74ani9YD3+f+R0=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jlqhn-007SDV-Jr
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 09:19:34 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B4A106DCA60A85C439D7;
 Thu, 18 Jun 2020 17:19:22 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 18 Jun
 2020 17:19:21 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20200616234216.21115-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <f289a376-91ca-0fab-3ffa-1d60c89a624c@huawei.com>
Date: Thu, 18 Jun 2020 17:19:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200616234216.21115-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jlqhn-007SDV-Jr
Subject: Re: [f2fs-dev] [PATCH] fsck: prevent buffer overrun in quota code
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/6/17 7:42, Jaegeuk Kim wrote:
> From: Robin Hsu <robinhsu@google.com>
> 
> A maliciously corrupted file systems can trigger buffer overruns in
> the quota code used by fsck.
> 
> To fix it, quota file sizes are checked against real allocated
> block index tables (inode, direct nodes, indirect nodes, double
> indirect nodes).  If the size mismatches, the quota file is considered
> corrupted and will be regenerated.
> 
> Signed-off-by: Robin Hsu <robinhsu@google.com>
> ---
>  fsck/fsck.c         | 21 +++++++++++++++++-
>  fsck/fsck.h         |  2 ++
>  fsck/mkquota.c      |  1 +
>  fsck/quotaio.c      | 10 ++++++++-
>  fsck/quotaio.h      | 13 ++++++++++-
>  fsck/quotaio_tree.c | 14 +++++++-----
>  fsck/quotaio_v2.c   | 53 +++++++++++++++++++++++++++++++++++++++++----
>  fsck/segment.c      | 21 ++++++++++++++++++
>  8 files changed, 122 insertions(+), 13 deletions(-)
> 
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index c249dfa..9a537af 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -792,6 +792,8 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
>  
>  	if ((node_blk->i.i_inline & F2FS_INLINE_DATA)) {
>  		unsigned int inline_size = MAX_INLINE_DATA(node_blk);
> +		if (cur_qtype != -1)
> +			qf_szchk_type[cur_qtype] = QF_SZCHK_INLINE;
>  		block_t blkaddr = le32_to_cpu(node_blk->i.i_addr[ofs]);
>  
>  		if (blkaddr != 0) {
> @@ -860,6 +862,15 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
>  	}
>  
>  	/* check data blocks in inode */
> +	if (cur_qtype != -1) {
> +		qf_szchk_type[cur_qtype] = QF_SZCHK_REGFILE;
> +		qf_maxsize[cur_qtype] = (ADDRS_PER_INODE(&node_blk->i) +
> +				2 * ADDRS_PER_BLOCK(&node_blk->i) +
> +				2 * ADDRS_PER_BLOCK(&node_blk->i) *
> +				NIDS_PER_BLOCK +
> +				(u64) ADDRS_PER_BLOCK(&node_blk->i) *
> +				NIDS_PER_BLOCK * NIDS_PER_BLOCK) * F2FS_BLKSIZE;
> +	}
>  	for (idx = 0; idx < ADDRS_PER_INODE(&node_blk->i);
>  						idx++, child.pgofs++) {
>  		block_t blkaddr = le32_to_cpu(node_blk->i.i_addr[ofs + idx]);
> @@ -884,6 +895,8 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
>  					file_is_encrypt(&node_blk->i));
>  			if (!ret) {
>  				*blk_cnt = *blk_cnt + 1;
> +				if (cur_qtype != -1 && blkaddr != NEW_ADDR)
> +					qf_size_chk[cur_qtype] = child.pgofs;
>  			} else if (c.fix_on) {
>  				node_blk->i.i_addr[ofs + idx] = 0;
>  				need_fix = 1;
> @@ -1126,6 +1139,8 @@ int fsck_chk_dnode_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
>  			file_is_encrypt(inode));
>  		if (!ret) {
>  			*blk_cnt = *blk_cnt + 1;
> +			if (cur_qtype != -1 && blkaddr != NEW_ADDR)
> +				qf_size_chk[cur_qtype] = child->pgofs;
>  		} else if (c.fix_on) {
>  			node_blk->dn.addr[idx] = 0;
>  			need_fix = 1;
> @@ -1794,6 +1809,7 @@ int fsck_chk_quota_node(struct f2fs_sb_info *sbi)
>  	u32 blk_cnt = 0;
>  
>  	for (qtype = 0; qtype < F2FS_MAX_QUOTAS; qtype++) {
> +		cur_qtype = qtype;
>  		if (sb->qf_ino[qtype] == 0)
>  			continue;
>  		nid_t ino = QUOTA_INO(sb, qtype);
> @@ -1811,10 +1827,13 @@ int fsck_chk_quota_node(struct f2fs_sb_info *sbi)
>  		}
>  		ret = fsck_chk_node_blk(sbi, NULL, ino,
>  				F2FS_FT_REG_FILE, TYPE_INODE, &blk_cnt, NULL);
> -		if (ret)
> +		if (ret) {
>  			ASSERT_MSG("wrong quota inode, qtype [%d] ino [0x%x]",
>  								qtype, ino);
> +			qf_szchk_type[qtype] = QF_SZCHK_ERR;
> +		}
>  	}
> +	cur_qtype = -1;
>  	return ret;
>  }
>  
> diff --git a/fsck/fsck.h b/fsck/fsck.h
> index 2de6f62..bc6a435 100644
> --- a/fsck/fsck.h
> +++ b/fsck/fsck.h
> @@ -266,6 +266,8 @@ block_t new_node_block(struct f2fs_sb_info *,
>  					struct dnode_of_data *, unsigned int);
>  
>  /* segment.c */
> +struct quota_file;
> +u64 f2fs_quota_size(struct quota_file *);
>  u64 f2fs_read(struct f2fs_sb_info *, nid_t, u8 *, u64, pgoff_t);
>  u64 f2fs_write(struct f2fs_sb_info *, nid_t, u8 *, u64, pgoff_t);
>  void f2fs_filesize_update(struct f2fs_sb_info *, nid_t, u64);
> diff --git a/fsck/mkquota.c b/fsck/mkquota.c
> index 84f9d3d..c419a0f 100644
> --- a/fsck/mkquota.c
> +++ b/fsck/mkquota.c
> @@ -378,6 +378,7 @@ errcode_t quota_compare_and_update(struct f2fs_sb_info *sbi,
>  	err = quota_file_open(sbi, &qh, qtype, 0);
>  	if (err) {
>  		log_debug("Open quota file failed");
> +		*usage_inconsistent = 1;
>  		goto out;
>  	}
>  
> diff --git a/fsck/quotaio.c b/fsck/quotaio.c
> index cc517bd..759c9e1 100644
> --- a/fsck/quotaio.c
> +++ b/fsck/quotaio.c
> @@ -33,6 +33,14 @@ struct disk_dqheader {
>  	__le32 dqh_version;
>  } __attribute__ ((packed));
>  
> +int cur_qtype = -1;
> +u32 qf_size_chk[MAXQUOTAS] = {0, 0, 0};
> +enum qf_szchk_type_t qf_szchk_type[MAXQUOTAS] =
> +{
> +	QF_SZCHK_NONE, QF_SZCHK_NONE, QF_SZCHK_NONE
> +};
> +u64 qf_maxsize[MAXQUOTAS];
> +
>  /**
>   * Convert type of quota to written representation
>   */
> @@ -140,7 +148,7 @@ errcode_t quota_file_open(struct f2fs_sb_info *sbi, struct quota_handle *h,
>  		goto errout;
>  	}
>  
> -	if (h->qh_ops->init_io && (h->qh_ops->init_io(h) < 0)) {
> +	if (h->qh_ops->init_io && (h->qh_ops->init_io(h, qtype) < 0)) {
>  		log_err("qh_ops->init_io failed");
>  		err = EIO;
>  		goto errout;
> diff --git a/fsck/quotaio.h b/fsck/quotaio.h
> index 8087309..4a366ce 100644
> --- a/fsck/quotaio.h
> +++ b/fsck/quotaio.h
> @@ -46,6 +46,17 @@ enum quota_type {
>  #error "cannot have more than 32 quota types to fit in qtype_bits"
>  #endif
>  
> +enum qf_szchk_type_t {
> +	QF_SZCHK_NONE,
> +	QF_SZCHK_ERR,
> +	QF_SZCHK_INLINE,
> +	QF_SZCHK_REGFILE,
> +};
> +
> +extern int cur_qtype;
> +extern u32 qf_size_chk[];
> +extern enum qf_szchk_type_t qf_szchk_type[];
> +extern u64 qf_maxsize[];
>  
>  #define QUOTA_USR_BIT (1 << USRQUOTA)
>  #define QUOTA_GRP_BIT (1 << GRPQUOTA)
> @@ -154,7 +165,7 @@ struct quotafile_ops {
>  	/* Check whether quotafile is in our format */
>  	int (*check_file) (struct quota_handle *h, int type);
>  	/* Open quotafile */
> -	int (*init_io) (struct quota_handle *h);
> +	int (*init_io) (struct quota_handle *h, enum quota_type qtype);
>  	/* Create new quotafile */
>  	int (*new_io) (struct quota_handle *h);
>  	/* Write all changes and close quotafile */
> diff --git a/fsck/quotaio_tree.c b/fsck/quotaio_tree.c
> index de25a60..c203400 100644
> --- a/fsck/quotaio_tree.c
> +++ b/fsck/quotaio_tree.c
> @@ -568,7 +568,7 @@ static int report_block(struct dquot *dquot, unsigned int blk, char *bitmap,
>  	int entries, i;
>  
>  	if (!buf)
> -		return 0;
> +		return -1;
>  
>  	set_bit(bitmap, blk);
>  	read_blk(dquot->dq_h, blk, buf);
> @@ -593,9 +593,7 @@ static int report_block(struct dquot *dquot, unsigned int blk, char *bitmap,
>  static int check_reference(struct quota_handle *h, unsigned int blk)
>  {
>  	if (blk >= h->qh_info.u.v2_mdqi.dqi_qtree.dqi_blocks) {
> -		log_err("Illegal reference (%u >= %u) in %s quota file. "
> -			"Quota file is probably corrupted.\n"
> -			"Please run fsck (8) to fix it.",
> +		log_err("Illegal reference (%u >= %u) in %s quota file",
>  			blk,
>  			h->qh_info.u.v2_mdqi.dqi_qtree.dqi_blocks,
>  			quota_type2name(h->qh_type));
> @@ -627,9 +625,13 @@ static int report_tree(struct dquot *dquot, unsigned int blk, int depth,
>  			break;
>  
>  		if (depth == QT_TREEDEPTH - 1) {
> -			if (!get_bit(bitmap, blk))
> -				*entries += report_block(dquot, blk, bitmap,
> +			if (!get_bit(bitmap, blk)) {
> +				int num_entry = report_block(dquot, blk, bitmap,
>  							process_dquot, data);
> +				if (num_entry < 0)
> +					break;
> +				*entries += num_entry;
> +			}
>  		} else {
>  			if (report_tree(dquot, blk, depth + 1, bitmap, entries,
>  						process_dquot, data))
> diff --git a/fsck/quotaio_v2.c b/fsck/quotaio_v2.c
> index 1404332..0f8672b 100644
> --- a/fsck/quotaio_v2.c
> +++ b/fsck/quotaio_v2.c
> @@ -20,7 +20,7 @@
>  #include "quotaio_tree.h"
>  
>  static int v2_check_file(struct quota_handle *h, int type);
> -static int v2_init_io(struct quota_handle *h);
> +static int v2_init_io(struct quota_handle *h, enum quota_type qtype);
>  static int v2_new_io(struct quota_handle *h);
>  static int v2_write_info(struct quota_handle *h);
>  static struct dquot *v2_read_dquot(struct quota_handle *h, qid_t id);
> @@ -170,19 +170,64 @@ static int v2_check_file(struct quota_handle *h, int type)
>  /*
>   * Open quotafile
>   */
> -static int v2_init_io(struct quota_handle *h)
> +static int v2_init_io(struct quota_handle *h, enum quota_type qtype)
>  {
>  	struct v2_disk_dqinfo ddqinfo;
> +	struct v2_mem_dqinfo *info;
> +	u64 filesize;
> +	struct quota_file *qf = &h->qh_qf;
>  
>  	h->qh_info.u.v2_mdqi.dqi_qtree.dqi_entry_size =
>  		sizeof(struct v2r1_disk_dqblk);
>  	h->qh_info.u.v2_mdqi.dqi_qtree.dqi_ops = &v2r1_fmt_ops;
>  
>  	/* Read information about quotafile */
> -	if (h->read(&h->qh_qf, V2_DQINFOOFF, &ddqinfo,
> -			 sizeof(ddqinfo)) != sizeof(ddqinfo))
> +	if (h->read(qf, V2_DQINFOOFF, &ddqinfo,
> +			sizeof(ddqinfo)) != sizeof(ddqinfo))
>  		return -1;
>  	v2_disk2memdqinfo(&h->qh_info, &ddqinfo);
> +
> +	/* Check to make sure quota file info is sane */
> +	info = &h->qh_info.u.v2_mdqi;
> +	filesize = qf->filesize = f2fs_quota_size(qf);
> +	u32 qf_szchk = qf_size_chk[qtype];
> +	if (qf_szchk_type[qtype] == QF_SZCHK_REGFILE &&
> +			((filesize + F2FS_BLKSIZE - 1) >> F2FS_BLKSIZE_BITS <
> +			qf_szchk + 1 || filesize > qf_maxsize[qtype])) {
> +		/*
> +		 * reqular: qf_szchk is now the last block index,
> +		 * including the hole's index

If so, I guess qf_last_blkofs will be more proper for the variable name.

> +		 */
> +		log_err("Quota inode %u corrupted: file size %" PRIu64
> +			" does not match page offset %" PRIu32,
> +			h->qh_qf.ino,
> +			filesize,
> +			qf_szchk);
> +		filesize = (qf_szchk + 1) << F2FS_BLKSIZE_BITS;
> +		f2fs_filesize_update(qf->sbi, qf->ino, filesize);
> +	}
> +
> +	if ((info->dqi_qtree.dqi_blocks >
> +			(filesize + QT_BLKSIZE - 1) >> QT_BLKSIZE_BITS)) {
> +		log_err("Quota inode %u corrupted: file size %" PRId64 "; "
> +				"dqi_blocks %u", h->qh_qf.ino,
> +				filesize, info->dqi_qtree.dqi_blocks);
> +		return -1;
> +	}
> +	if (info->dqi_qtree.dqi_free_blk >= info->dqi_qtree.dqi_blocks) {
> +		log_err("Quota inode %u corrupted: free_blk %u;"
> +				" dqi_blocks %u",
> +				h->qh_qf.ino, info->dqi_qtree.dqi_free_blk,
> +				info->dqi_qtree.dqi_blocks);
> +		return -1;
> +	}
> +	if (info->dqi_qtree.dqi_free_entry >= info->dqi_qtree.dqi_blocks) {
> +		log_err("Quota inode %u corrupted: free_entry %u; "
> +				"dqi_blocks %u", h->qh_qf.ino,
> +				info->dqi_qtree.dqi_free_entry,
> +				info->dqi_qtree.dqi_blocks);
> +		return -1;
> +	}
>  	return 0;
>  }
>  
> diff --git a/fsck/segment.c b/fsck/segment.c
> index b7cf245..a5dc556 100644
> --- a/fsck/segment.c
> +++ b/fsck/segment.c
> @@ -15,6 +15,7 @@
>   */
>  #include "fsck.h"
>  #include "node.h"
> +#include "quotaio.h"
>  
>  int reserve_new_block(struct f2fs_sb_info *sbi, block_t *to,
>  			struct f2fs_summary *sum, int type, bool is_inode)
> @@ -124,6 +125,26 @@ int new_data_block(struct f2fs_sb_info *sbi, void *block,
>  	return 0;
>  }
>  
> +u64 f2fs_quota_size(struct quota_file *qf)
> +{
> +	struct node_info ni;
> +	struct f2fs_node *inode;
> +	u64 filesize;
> +
> +	inode = (struct f2fs_node *) calloc(BLOCK_SZ, 1);
> +	ASSERT(inode);
> +
> +	/* Read inode */
> +	get_node_info(qf->sbi, qf->ino, &ni);
> +	ASSERT(dev_read_block(inode, ni.blk_addr) >= 0);
> +	ASSERT(!S_ISDIR(le16_to_cpu(inode->i.i_mode)));
> +	ASSERT(!S_ISLNK(le16_to_cpu(inode->i.i_mode)));

Why not ASSERT(S_ISREG())? or we can introduce another function to repair
such fuzzed quota inode?

Thanks,

> +
> +	filesize = le64_to_cpu(inode->i.i_size);
> +	free(inode);
> +	return filesize;
> +}
> +
>  u64 f2fs_read(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
>  					u64 count, pgoff_t offset)
>  {
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
