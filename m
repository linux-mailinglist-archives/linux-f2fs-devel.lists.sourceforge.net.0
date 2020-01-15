Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E3D13CF44
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jan 2020 22:38:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1irqNA-0003Fn-8O; Wed, 15 Jan 2020 21:38:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1irqN8-0003Fe-Eh
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jan 2020 21:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oGSLVHs+Ybl0RHMenwEJvmcoMxUk1Ma9gjKXCOuQS+U=; b=ku/ce/lQ2gVe89cT178KsMk+F5
 9YFX6qRD2vdKRTuepuKJ1U2uiwsOQj3j3HElfspw2MqfH//17h6mRzlY1bR4WBgiWYV4gAsE+oSAJ
 wDT3D503O7YpqE5IEg2ofL+SOj18DXGeqRG8LZggY6mgY835mCMjHM9AKCcU5BnNzDE8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oGSLVHs+Ybl0RHMenwEJvmcoMxUk1Ma9gjKXCOuQS+U=; b=d94sdPM3KWdF1U5G3qeCXGO/GV
 oBlsLbYEyKI52g3IHX4IBeQkaiTj8jOaZk1Ho76jF57Ignsjs1nxNOPw9X4s/EdBl+PvFiyBtZLF1
 SV3b8iXJ8wazrPqDAPzfZP0u4+Pah0knjjRWWtx7sMwl96D1rGSEp9Q8qBGho1sEzZ00=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1irqN5-005US5-Jp
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jan 2020 21:38:42 +0000
Received: from localhost (unknown [104.132.0.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 26F00222C3;
 Wed, 15 Jan 2020 21:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579124309;
 bh=cE+xij9LfRwsxyi5KbsdsITMdSbn4+7niQZVZvT3/rk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BjaFD3REDaQ4JfKXUuA/X1xYF/0xuzV7ZCDHALOjqkhGrcnFKP9Ksq7WdTmCMrxU/
 uiJhD9bWI+1KyuuYuWprDSPiBEyQTUSyP78eE7+po30eam27LfOYlisCTJBKFEIYvB
 El25Z/jPHdYyNslEatfNrUrrpBG9KhflhSRHW6k0=
Date: Wed, 15 Jan 2020 13:38:28 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200115213828.GA57854@jaegeuk-macbookpro.roam.corp.google.com>
References: <94786408-219d-c343-70f2-70a2cc68dd38@huawei.com>
 <20200106181620.GB50058@jaegeuk-macbookpro.roam.corp.google.com>
 <20200110235214.GA25700@jaegeuk-macbookpro.roam.corp.google.com>
 <3776cb0b-4b18-ae0d-16a7-a591bec77a5e@huawei.com>
 <20200111180200.GA36424@jaegeuk-macbookpro.roam.corp.google.com>
 <72418aa5-7d2a-de26-f0b5-9c839f0c3404@huawei.com>
 <20200113161120.GA49290@jaegeuk-macbookpro.roam.corp.google.com>
 <326f0049-936c-7dc4-52c3-aa64e13b2cc6@huawei.com>
 <20200114224837.GB19274@jaegeuk-macbookpro.roam.corp.google.com>
 <d68d27d3-2501-2641-d929-6293dfe683b0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d68d27d3-2501-2641-d929-6293dfe683b0@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1irqN5-005US5-Jp
Subject: Re: [f2fs-dev] [RFC PATCH v5] f2fs: support data compression
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/15, Chao Yu wrote:
> On 2020/1/15 6:48, Jaegeuk Kim wrote:
> > On 01/14, Chao Yu wrote:
> >> On 2020/1/14 0:11, Jaegeuk Kim wrote:
> >>> On 01/13, Chao Yu wrote:
> >>>> On 2020/1/12 2:02, Jaegeuk Kim wrote:
> >>>>> On 01/11, Chao Yu wrote:
> >>>>>> On 2020/1/11 7:52, Jaegeuk Kim wrote:
> >>>>>>> On 01/06, Jaegeuk Kim wrote:
> >>>>>>>> On 01/06, Chao Yu wrote:
> >>>>>>>>> On 2020/1/3 14:50, Chao Yu wrote:
> >>>>>>>>>> This works to me. Could you run fsstress tests on compressed root directory?
> >>>>>>>>>> It seems still there are some bugs.
> >>>>>>>>>
> >>>>>>>>> Jaegeuk,
> >>>>>>>>>
> >>>>>>>>> Did you mean running por_fsstress testcase?
> >>>>>>>>>
> >>>>>>>>> Now, at least I didn't hit any problem for normal fsstress case.
> >>>>>>>>
> >>>>>>>> Yup. por_fsstress
> >>>>>>>
> >>>>>>> Please check https://github.com/jaegeuk/f2fs/commits/g-dev-test.
> >>>>>>> I've fixed
> >>>>>>> - truncation offset
> >>>>>>> - i_compressed_blocks and its lock coverage
> >>>>>>> - error handling
> >>>>>>> - etc
> >>>>>>
> >>>>>> I changed as below, and por_fsstress stops panic the system.
> >>>>>>
> >>>>>> Could you merge all these fixes into original patch?
> >>>>>
> >>>>> Yup, let m roll up some early patches first once test results become good.
> >>>>
> >>>> I didn't encounter issue any more, how about por_fsstress test result in your
> >>>> enviornment? If there is, please share the call stack with me.
> >>>
> >>> Sure, will do, once I hit an issue. BTW, I'm hitting another unreacheable nat
> >>> entry issue during por_stress without compression. :(
> >>
> >> Did you enable any features during por_fsstress test?
> >>
> >> I only hit below warning during por_fsstress test on image w/o compression.
> >>
> >> ------------[ cut here ]------------
> >> WARNING: CPU: 10 PID: 33483 at fs/fs-writeback.c:1448 __writeback_single_inode+0x28c/0x340
> >> Call Trace:
> >>  writeback_single_inode+0xad/0x120
> >>  sync_inode_metadata+0x3d/0x60
> >>  f2fs_sync_inode_meta+0x90/0xe0 [f2fs]
> >>  block_operations+0x17c/0x360 [f2fs]
> >>  f2fs_write_checkpoint+0x101/0xff0 [f2fs]
> >>  f2fs_sync_fs+0xa8/0x130 [f2fs]
> >>  f2fs_do_sync_file+0x19c/0x880 [f2fs]
> >>  do_fsync+0x38/0x60
> >>  __x64_sys_fsync+0x10/0x20
> >>  do_syscall_64+0x5f/0x220
> >>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > 
> > Does gc_mutex patch fix this?
> 
> No, gc_mutex patch fixes another problem.
> 
> BTW, it looks like a bug of VFS.

One fix below and rerun tests now.

---
 fs/f2fs/compress.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 2480bff1e115..45a6f20ceb3e 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -556,10 +556,8 @@ static int f2fs_compressed_blocks(struct compress_ctx *cc)
 
 			blkaddr = datablock_addr(dn.inode,
 					dn.node_page, dn.ofs_in_node + i);
-			if (blkaddr != NULL_ADDR) {
+			if (blkaddr != NULL_ADDR)
 				ret++;
-				break;
-			}
 		}
 	}
 fail:
@@ -955,10 +953,14 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 					enum iostat_type io_type)
 {
 	struct address_space *mapping = cc->inode->i_mapping;
-	int i, _submitted, compr_blocks, ret;
-	int err = 0;
+	int _submitted, compr_blocks, ret;
+	int i = -1, err = 0;
 
 	compr_blocks = f2fs_compressed_blocks(cc);
+	if (compr_blocks < 0) {
+		err = compr_blocks;
+		goto out_err;
+	}
 
 	for (i = 0; i < cc->cluster_size; i++) {
 		if (!cc->rpages[i])
@@ -997,7 +999,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 out_fail:
 	/* TODO: revoke partially updated block addresses */
 	BUG_ON(compr_blocks);
-
+out_err:
 	for (++i; i < cc->cluster_size; i++) {
 		if (!cc->rpages[i])
 			continue;
@@ -1020,9 +1022,9 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
 	*submitted = 0;
 	if (cluster_may_compress(cc)) {
 		err = f2fs_compress_pages(cc);
-		if (err == -EAGAIN)
+		if (err == -EAGAIN) {
 			goto write;
-		else if (err) {
+		} else if (err) {
 			f2fs_put_rpages_wbc(cc, wbc, true, 1);
 			goto destroy_out;
 		}
-- 
2.24.0.525.g8f36a354ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
