Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC9E54CF25
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jun 2022 18:58:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1WL9-0000vd-CB; Wed, 15 Jun 2022 16:57:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1o1WL8-0000vX-Kb
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jun 2022 16:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jw60lP8NZIDsC2mhHyrBKyTDjd4k2PXJLoTccJczm8A=; b=gIobryfVipjkMfkQVZcLd+dFIM
 /3jYL4yR8Cnem4GczrnhBgShXcylu7UJcsNtb72BG2h3O+/yxTfLD15NM/DtKwd16KHk/BuO777dG
 SQQC60+slbuUJM2EqskkANfk36Gh/FpcBMrr0M2yL11AET4q1ybV6O5a35pWRYJkgQ8g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jw60lP8NZIDsC2mhHyrBKyTDjd4k2PXJLoTccJczm8A=; b=dBAK4QgL3/GuFvEPpmbnfKphKP
 ZqOnaYN9EMe6abvXQrxOFu7KwTZZEniPPGbOElt0THSrsOMqMKgWD3RcJm693OEbt5tMfB2V0KMPk
 05A1AmmkBiu8RoSLAqRT2qYpshWarZZy+zKjb0Kr1rYPYShKoBUFNeeHPY+24SvFkmVA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o1WL4-0001bi-W8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jun 2022 16:57:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0FA72B82063;
 Wed, 15 Jun 2022 16:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9D2C34115;
 Wed, 15 Jun 2022 16:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655312268;
 bh=i3WV7Ggz9fjwDRn6rp00ScHwyt9GNSgltre8FPoHzkE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aT6VUPW2W4qh8hFZbpYlRniQCGigOHq/3bNG1NTxq52FlIyXR7+dR7b6C6vZ6qG1f
 1UVPFU3lv87l4UsUbSKGLVQZtyBHUd1O9INWhXe9Sc7f9vrSPoYuefPr8yqcw7CpZA
 I2tgXCyG8Jx71JK92O++yZhANAD4EXyYCyaJjo66uv2Ok8LjZZOIrZ8JYCDRQiz3Lu
 spROxE1iYXD+nV1gDoplDaMxEM1fQsWHBdtYzFqaMaAnNkVN3pv9jIzDzeudnCcmGT
 rfl1in+ssajR6MHGIRX0FYXNtdf3vuMO67ct2gZ0HHLZNWVhgp2KxlJ4iXnotpBodJ
 9oKlwW8rrIR3Q==
Date: Wed, 15 Jun 2022 09:57:46 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yufen Yu <yuyufen@huawei.com>
Message-ID: <YqoPikFsLQHVFOYR@google.com>
References: <20220607034043.636316-1-yuyufen@huawei.com>
 <12ec21b2-5cc2-f6dc-de4f-5b1c8d601b09@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <12ec21b2-5cc2-f6dc-de4f-5b1c8d601b09@huawei.com>
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/15,
 Yufen Yu via Linux-f2fs-devel wrote: > gentry ping...
 Thanks, merged. > > On 2022/6/7 11:40, Yufen Yu wrote: > > Usage: > > dump.f2fs
 -I [inode nid] /dev/sda > > > > This feature can be useful for some bugs
 caused by system crash. > > We not only need dump current valid [...] 
 Content analysis details:   (-6.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o1WL4-0001bi-W8
Subject: Re: [f2fs-dev] [PATCH v3] dump.f2fs: add -I nid to dump inode by
 scan full disk
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/15, Yufen Yu via Linux-f2fs-devel wrote:
> gentry ping...

Thanks, merged.

> 
> On 2022/6/7 11:40, Yufen Yu wrote:
> > Usage:
> > 	dump.f2fs -I [inode nid] /dev/sda
> > 
> > This feature can be useful for some bugs caused by system crash.
> > We not only need dump current valid node page, but alse the history
> > data in disk, which can give some clues for status change of the inode.
> > 
> > Signed-off-by: Yufen Yu <yuyufen@huawei.com>
> > ---
> >   fsck/dump.c     | 33 +++++++++++++++++++++++++++++++++
> >   fsck/fsck.h     |  1 +
> >   fsck/main.c     | 14 +++++++++++++-
> >   man/dump.f2fs.8 |  7 +++++++
> >   4 files changed, 54 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fsck/dump.c b/fsck/dump.c
> > index fce86c9..b8f6144 100644
> > --- a/fsck/dump.c
> > +++ b/fsck/dump.c
> > @@ -539,6 +539,39 @@ static bool is_sit_bitmap_set(struct f2fs_sb_info *sbi, u32 blk_addr)
> >   			(const char *)se->cur_valid_map) != 0;
> >   }
> > +void dump_node_scan_disk(struct f2fs_sb_info *sbi, nid_t nid)
> > +{
> > +	struct f2fs_node *node_blk;
> > +	pgoff_t blkaddr;
> > +	int ret;
> > +	pgoff_t start_blkaddr = SM_I(sbi)->main_blkaddr;
> > +	pgoff_t end_blkaddr = start_blkaddr +
> > +		(SM_I(sbi)->main_segments << sbi->log_blocks_per_seg);
> > +
> > +	node_blk = calloc(BLOCK_SZ, 1);
> > +	ASSERT(node_blk);
> > +	MSG(0, "Info: scan all nid: %u from block_addr [%lu: %lu]\n",
> > +			nid, start_blkaddr, end_blkaddr);
> > +
> > +	for (blkaddr = start_blkaddr; blkaddr < end_blkaddr; blkaddr++) {
> > +		struct seg_entry *se = get_seg_entry(sbi, GET_SEGNO(sbi, blkaddr));
> > +		if (se->type < CURSEG_HOT_NODE)
> > +			continue;
> > +
> > +		ret = dev_read_block(node_blk, blkaddr);
> > +		ASSERT(ret >= 0);
> > +		if (le32_to_cpu(node_blk->footer.ino) != nid ||
> > +				le32_to_cpu(node_blk->footer.nid) != nid)
> > +			continue;
> > +		MSG(0, "Info: nid: %u, blkaddr: %lu\n", nid, blkaddr);
> > +		MSG(0, "node_blk.footer.flag [0x%x]\n", le32_to_cpu(node_blk->footer.flag));
> > +		MSG(0, "node_blk.footer.cp_ver [%x]\n", (u32)(cpver_of_node(node_blk)));
> > +		print_inode_info(sbi, node_blk, 0);
> > +	}
> > +
> > +	free(node_blk);
> > +}
> > +
> >   int dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force)
> >   {
> >   	struct node_info ni;
> > diff --git a/fsck/fsck.h b/fsck/fsck.h
> > index ce5fffe..0c819f0 100644
> > --- a/fsck/fsck.h
> > +++ b/fsck/fsck.h
> > @@ -262,6 +262,7 @@ struct dump_option {
> >   	int start_ssa;
> >   	int end_ssa;
> >   	int32_t blk_addr;
> > +	nid_t scan_nid;
> >   };
> >   extern void nat_dump(struct f2fs_sb_info *, nid_t, nid_t);
> > diff --git a/fsck/main.c b/fsck/main.c
> > index e4cfdf4..c7ad5ad 100644
> > --- a/fsck/main.c
> > +++ b/fsck/main.c
> > @@ -93,6 +93,7 @@ void dump_usage()
> >   	MSG(0, "[options]:\n");
> >   	MSG(0, "  -d debug level [default:0]\n");
> >   	MSG(0, "  -i inode no (hex)\n");
> > +	MSG(0, "  -I inode no (hex) scan full disk\n");
> >   	MSG(0, "  -n [NAT dump nid from #1~#2 (decimal), for all 0~-1]\n");
> >   	MSG(0, "  -M show a block map\n");
> >   	MSG(0, "  -s [SIT dump segno from #1~#2 (decimal), for all 0~-1]\n");
> > @@ -382,7 +383,7 @@ void f2fs_parse_options(int argc, char *argv[])
> >   		}
> >   	} else if (!strcmp("dump.f2fs", prog)) {
> >   #ifdef WITH_DUMP
> > -		const char *option_string = "d:i:n:Ms:Sa:b:V";
> > +		const char *option_string = "d:i:I:n:Ms:Sa:b:V";
> >   		static struct dump_option dump_opt = {
> >   			.nid = 0,	/* default root ino */
> >   			.start_nat = -1,
> > @@ -392,6 +393,7 @@ void f2fs_parse_options(int argc, char *argv[])
> >   			.start_ssa = -1,
> >   			.end_ssa = -1,
> >   			.blk_addr = -1,
> > +			.scan_nid = 0,
> >   		};
> >   		c.func = DUMP;
> > @@ -424,6 +426,14 @@ void f2fs_parse_options(int argc, char *argv[])
> >   					ret = sscanf(optarg, "%x",
> >   							&dump_opt.nid);
> >   				break;
> > +			case 'I':
> > +				if (strncmp(optarg, "0x", 2))
> > +					ret = sscanf(optarg, "%d",
> > +							&dump_opt.scan_nid);
> > +				else
> > +					ret = sscanf(optarg, "%x",
> > +							&dump_opt.scan_nid);
> > +				break;
> >   			case 'n':
> >   				ret = sscanf(optarg, "%d~%d",
> >   							&dump_opt.start_nat,
> > @@ -916,6 +926,8 @@ static void do_dump(struct f2fs_sb_info *sbi)
> >   		dump_info_from_blkaddr(sbi, opt->blk_addr);
> >   	if (opt->nid)
> >   		dump_node(sbi, opt->nid, 0);
> > +	if (opt->scan_nid)
> > +		dump_node_scan_disk(sbi, opt->scan_nid);
> >   	print_cp_state(flag);
> > diff --git a/man/dump.f2fs.8 b/man/dump.f2fs.8
> > index 1ddb7fc..94bf5f3 100644
> > --- a/man/dump.f2fs.8
> > +++ b/man/dump.f2fs.8
> > @@ -10,6 +10,10 @@ dump.f2fs \- retrieve directory and file entries from an F2FS-formated image
> >   .I inode number
> >   ]
> >   [
> > +.B \-I
> > +.I inode number
> > +]
> > +[
> >   .B \-n
> >   .I NAT range
> >   ]
> > @@ -52,6 +56,9 @@ is 0 on success and -1 on failure.
> >   .BI \-i " inode number"
> >   Specify an inode number to dump out.
> >   .TP
> > +.BI \-I " inode number"
> > +Specify an inode number and scan full disk to dump out, include history inode block
> > +.TP
> >   .BI \-n " NAT range"
> >   Specify a range presented by nids to dump NAT entries.
> >   .TP
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
