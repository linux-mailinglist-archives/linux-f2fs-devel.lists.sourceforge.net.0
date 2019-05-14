Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8107E1C85E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 May 2019 14:18:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:In-Reply-To:
	References:To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syfogwlIm6V7u97kWLt2tsBseQuDZsLMUiULju2srpU=; b=QiMwP77fyibEGfF5KWi9ERWYqt
	oEQnYAiTpuPsogUPhMrmcKM8XqwruoVlVDmTbdoISSnYyH03f6Rzl9Dw5TrcDMUkNcGzs/k9n6+8r
	EagAHYCPMFVGtzya2W5q8Mti3JU7PH3cW5Vesbeb3rW/+1WUnnBn1pGySeHOwQZJ8BEg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQWNa-0000T2-38; Tue, 14 May 2019 12:17:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <zhaowuyun@wingtech.com>) id 1hQWNX-0000SX-Ra
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 12:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ou7jvMTlL269Nu51/XD+v9XiGRS3FfdovEBj2XQuIwQ=; b=LQ6njprO9zDeamSvnKBpT5Z+Qj
 KYmQelp8KoHAfLh3DNb1aNgqur+YK7FkWp59/23eiAskszEv0UHXtIYxu3kjmZ0DPK1C//WSN5IoC
 gMwbDimwaXV0XbuWsdz/1Dl3x4mKNDXWI1WI/YhphJ3YihvaU6p5lIwXSapvIceRbgnw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ou7jvMTlL269Nu51/XD+v9XiGRS3FfdovEBj2XQuIwQ=; b=QIa76j50hhvcqtWAla1daFwT1S
 Og/aTTY0doQEYUPdL5ROHi6euac0RmmoZ1QETe2RdwsWYLwnZysy8gj7LibqwpkhZC3LpH7bfn7F4
 GUrEi9J9WktVoQlbfDmdgFFuDDRenR5pns3YqxaFSferXHuwBd/8tSmWyAvrly013UVI=;
Received: from mail.wingtech.com ([180.166.216.14])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA:256) (Exim 4.90_1) id 1hQWNS-00GXPJ-TN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 12:17:53 +0000
Received: from zhaowuyun ([192.168.50.243]) (user=zhaowuyun mech=LOGIN bits=0)
 by mail.wingtech.com  with ESMTP id x4ECHfGJ002044-x4ECHfGK002044;
 Tue, 14 May 2019 20:17:41 +0800
To: "'Chao Yu'" <yuchao0@huawei.com>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20190506085806.62874-1-yuchao0@huawei.com>
In-Reply-To: <20190506085806.62874-1-yuchao0@huawei.com>
Date: Tue, 14 May 2019 20:17:41 +0800
Message-ID: <000101d50a4f$071ec990$155c5cb0$@wingtech.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQLG8xWv0NeZXaMYNOZ84Z3hvveW36SGt8MQ
Content-Language: zh-cn
X-FEAS-AUTH-USER: zhaowuyun
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [180.166.216.14 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hQWNS-00GXPJ-TN
Subject: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0ggdjQgMi8yXSBzbG9hZC5mMmZz?=
	=?utf-8?q?=3A_introduce_f2fs=5Fsparse=5Finitialize=5Fmeta=28=29?=
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
From: zhaowuyun via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: zhaowuyun <zhaowuyun@wingtech.com>
Cc: jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

using the same steps, 
make the userdata partition dirty and fastboot-flash userdata.img to see the mount is successful or not

to test the patch, confirm that issue is fixed by this patch.
Hope to see it accepted.

Best Wishes,
Zac (zhaowuyun@wingtech.com)

> 
> This patch fixes to initialize NAT/SIT/CP.payload region in sparse file mode for
> sload.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> - move initialize_meta() before do_umount().
>  fsck/fsck.h  |  1 +
>  fsck/main.c  |  4 +++
>  fsck/mount.c | 70
> ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 75 insertions(+)
> 
> diff --git a/fsck/fsck.h b/fsck/fsck.h
> index dd831de..4db14af 100644
> --- a/fsck/fsck.h
> +++ b/fsck/fsck.h
> @@ -181,6 +181,7 @@ extern int fsck_verify(struct f2fs_sb_info *);  extern
> void fsck_free(struct f2fs_sb_info *);  extern int f2fs_do_mount(struct
> f2fs_sb_info *);  extern void f2fs_do_umount(struct f2fs_sb_info *);
> +extern int f2fs_sparse_initialize_meta(struct f2fs_sb_info *);
> 
>  extern void flush_journal_entries(struct f2fs_sb_info *);  extern void
> zero_journal_entries(struct f2fs_sb_info *); diff --git a/fsck/main.c
> b/fsck/main.c index afdfec9..d844820 100644
> --- a/fsck/main.c
> +++ b/fsck/main.c
> @@ -813,6 +813,10 @@ fsck_again:
>  		if (do_sload(sbi))
>  			goto out_err;
> 
> +		ret = f2fs_sparse_initialize_meta(sbi);
> +		if (ret < 0)
> +			goto out_err;
> +
>  		f2fs_do_umount(sbi);
> 
>  		/* fsck to fix missing quota */
> diff --git a/fsck/mount.c b/fsck/mount.c index 843742e..230f330 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -2721,3 +2721,73 @@ void f2fs_do_umount(struct f2fs_sb_info *sbi)
>  	free(sbi->ckpt);
>  	free(sbi->raw_super);
>  }
> +
> +#ifdef WITH_ANDROID
> +int f2fs_sparse_initialize_meta(struct f2fs_sb_info *sbi) {
> +	struct f2fs_super_block *sb = sbi->raw_super;
> +	u_int32_t sit_seg_count, sit_size;
> +	u_int32_t nat_seg_count, nat_size;
> +	u_int64_t sit_seg_addr, nat_seg_addr, payload_addr;
> +	u_int32_t seg_size = 1 << get_sb(log_blocks_per_seg);
> +	int ret;
> +
> +	if (!c.sparse_mode)
> +		return 0;
> +
> +	sit_seg_addr = get_sb(sit_blkaddr);
> +	sit_seg_count = get_sb(segment_count_sit);
> +	sit_size = sit_seg_count * seg_size;
> +
> +	DBG(1, "\tSparse: filling sit area at block offset: 0x%08"PRIx64"
> len: %u\n",
> +							sit_seg_addr,
> sit_size);
> +	ret = dev_fill(NULL, sit_seg_addr * F2FS_BLKSIZE,
> +					sit_size * F2FS_BLKSIZE);
> +	if (ret) {
> +		MSG(1, "\tError: While zeroing out the sit area "
> +				"on disk!!!\n");
> +		return -1;
> +	}
> +
> +	nat_seg_addr = get_sb(nat_blkaddr);
> +	nat_seg_count = get_sb(segment_count_nat);
> +	nat_size = nat_seg_count * seg_size;
> +
> +	DBG(1, "\tSparse: filling nat area at block offset 0x%08"PRIx64"
> len: %u\n",
> +							nat_seg_addr,
> nat_size);
> +	ret = dev_fill(NULL, nat_seg_addr * F2FS_BLKSIZE,
> +					nat_size * F2FS_BLKSIZE);
> +	if (ret) {
> +		MSG(1, "\tError: While zeroing out the nat area "
> +				"on disk!!!\n");
> +		return -1;
> +	}
> +
> +	payload_addr = get_sb(segment0_blkaddr) + 1;
> +
> +	DBG(1, "\tSparse: filling bitmap area at block offset 0x%08"PRIx64"
> len: %u\n",
> +					payload_addr, get_sb(cp_payload));
> +	ret = dev_fill(NULL, payload_addr * F2FS_BLKSIZE,
> +					get_sb(cp_payload) * F2FS_BLKSIZE);
> +	if (ret) {
> +		MSG(1, "\tError: While zeroing out the nat/sit bitmap area "
> +				"on disk!!!\n");
> +		return -1;
> +	}
> +
> +	payload_addr += seg_size;
> +
> +	DBG(1, "\tSparse: filling bitmap area at block offset 0x%08"PRIx64"
> len: %u\n",
> +					payload_addr, get_sb(cp_payload));
> +	ret = dev_fill(NULL, payload_addr * F2FS_BLKSIZE,
> +					get_sb(cp_payload) * F2FS_BLKSIZE);
> +	if (ret) {
> +		MSG(1, "\tError: While zeroing out the nat/sit bitmap area "
> +				"on disk!!!\n");
> +		return -1;
> +	}
> +	return 0;
> +}
> +#else
> +int f2fs_sparse_initialize_meta(struct f2fs_sb_info *sbi) { return 0; }
> +#endif
> --
> 2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
