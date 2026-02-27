Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CIsLKT+oWl4yAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 21:29:24 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BB41BDA64
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 21:29:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XtfC0cXicoYFsFEO4CCygaMKf0524zvqocky+1Nv1Vs=; b=Hf9VlrHvwflYYbWsVvPUpuvgRL
	fM2ILrrl3q6kizvgUix7st4AzvRo7+MeGgPFbPTvXJC7AR5PgiM2Q0QHjmzrLW/3TDTXy+08yATmt
	TPkR+axrj+zVfS7qySpE3wk1nIuyXtTfm96h2vOyx0JwkDDcfFWIFXXnvI4LXYcP5iAo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vw4SX-0005d6-EC;
	Fri, 27 Feb 2026 20:29:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vw4SW-0005cz-16
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 20:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DAnumQhVRsy5RqXwZklJaicOq6bfLeN1Pvi6voi2fDM=; b=iPUTxvVNakgwb26d4h09HPrlC4
 t1CoRSBWYorVZfELTTQlnpu0/nzz7axmwTHZNFRJpIgOXLuB0K7GvqX5bTUq+UXrUaZgmjhT4LS40
 +45Grvs03nJcOItDe9KFTf5SEAxTcVK9l8s3K+hle1bulVhCtTJIM0CpowsdkZRd9Eos=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DAnumQhVRsy5RqXwZklJaicOq6bfLeN1Pvi6voi2fDM=; b=J4DdUGaQVZnQcmOp+kLKVK1Jwu
 Gge98mnTldC7iYmgnYu9UAcP/bQsqgSJcaexYTRxDPTaZiY9d96ozYgExmLZfx3A11lBbccDbFNb9
 TPHe5KbdE75cBMJToVOQ79DSz/fR/KmIFgkM5dDshSXJzYGcLnOythBs+OLob/b2uMtQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vw4SV-0002yg-7Y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 20:29:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 82D2B6013F;
 Fri, 27 Feb 2026 20:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7CBAC116C6;
 Fri, 27 Feb 2026 20:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772224140;
 bh=alCtN+yAPb0hO332yCZoBLY/vHWdR4J5FN+tx5wQcXI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TizHpxsVDuLcmJKI8RtN3qoqg87tdMymADKj4245m40099oNeZPrzVUWTglJH54D5
 LlPfic6BKiP7ZCAwvX+qXSqSsWbZZ+IQ34xU8slYRhLlEILBmpNgYhaU2C7EimAY3h
 SNJcYSdEQ1KDJbQ4QDCYsjIIOKJrk+aA96XE3qXbLnMVTOt5FeUnYZQY0hnby+bwp2
 FKYwN4LgVUkKiv+h0l5OLkuiMl9Fu5dlK0/ii9lwvfB2XxufgNdgsZ20ZS66yx2WYI
 WeJYgqZnj2e5nhBD85pDRX+i8xmhNzHeoCtgHFhNbdz9fjqztU9trIa/FFUfyydYwp
 B97DqLcLtHtDw==
Date: Fri, 27 Feb 2026 20:28:58 +0000
To: Dan Carpenter <dan.carpenter@linaro.org>
Message-ID: <aaH-iiLeA7R6DOJe@google.com>
References: <202602242237.boCX8y4A-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202602242237.boCX8y4A-lkp@intel.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/24, Dan Carpenter wrote: > tree:
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev-test > head: 0c3712423755e851debb4021af26802b75d1cb9d > commit:
 0c3712423755e851debb4021af26 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vw4SV-0002yg-7Y
Subject: Re: [f2fs-dev] [jaegeuk-f2fs:dev-test 5/5] fs/f2fs/gc.c:1286
 ra_data_block() warn: missing error code 'err'
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: oe-kbuild@lists.linux.dev, Sheng Yong <shengyong1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, oe-kbuild-all@lists.linux.dev,
 lkp@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dan.carpenter@linaro.org,m:oe-kbuild@lists.linux.dev,m:shengyong1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,m:oe-kbuild-all@lists.linux.dev,m:lkp@intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,linaro.org:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org]
X-Rspamd-Queue-Id: C8BB41BDA64
X-Rspamd-Action: no action

On 02/24, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
> head:   0c3712423755e851debb4021af26802b75d1cb9d
> commit: 0c3712423755e851debb4021af26802b75d1cb9d [5/5] f2fs: avoid reading already updated pages during GC
> config: csky-randconfig-r071-20260224 (https://download.01.org/0day-ci/archive/20260224/202602242237.boCX8y4A-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 15.2.0
> smatch version: v0.5.0-8994-gd50c5a4c
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202602242237.boCX8y4A-lkp@intel.com/
> 
> smatch warnings:
> fs/f2fs/gc.c:1286 ra_data_block() warn: missing error code 'err'
> 
> vim +/err +1286 fs/f2fs/gc.c
> 
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1217  static int ra_data_block(struct inode *inode, pgoff_t index)
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1218  {
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1219  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> f18d00769336897 Sunmin Jeong            2024-07-10  1220  	struct address_space *mapping = f2fs_is_cow_file(inode) ?
> f18d00769336897 Sunmin Jeong            2024-07-10  1221  				F2FS_I(inode)->atomic_inode->i_mapping : inode->i_mapping;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1222  	struct dnode_of_data dn;
> e0b89d00ea9f846 Chao Yu                 2025-10-14  1223  	struct folio *folio, *efolio;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1224  	struct f2fs_io_info fio = {
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1225  		.sbi = sbi,
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1226  		.ino = inode->i_ino,
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1227  		.type = DATA,
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1228  		.temp = COLD,
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1229  		.op = REQ_OP_READ,
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1230  		.op_flags = 0,
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1231  		.encrypted_page = NULL,
> 2eae077e6e46f90 Chao Yu                 2023-02-02  1232  		.in_list = 0,
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1233  	};
> 0c3712423755e85 Jianan Huang            2026-02-09  1234  	int err = 0;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1235  
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1236) 	folio = f2fs_grab_cache_folio(mapping, index, true);
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1237) 	if (IS_ERR(folio))
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1238) 		return PTR_ERR(folio);
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1239  
> 04a91ab01684744 Christoph Hellwig       2022-11-28  1240  	if (f2fs_lookup_read_extent_cache_block(inode, index,
> 04a91ab01684744 Christoph Hellwig       2022-11-28  1241  						&dn.data_blkaddr)) {
> 93770ab7a6e9631 Chao Yu                 2019-04-15  1242  		if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
> 93770ab7a6e9631 Chao Yu                 2019-04-15  1243  						DATA_GENERIC_ENHANCE_READ))) {
> 10f966bbf521bb9 Chao Yu                 2019-06-20  1244  			err = -EFSCORRUPTED;
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1245) 			goto put_folio;
> 93770ab7a6e9631 Chao Yu                 2019-04-15  1246  		}
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1247  		goto got_it;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1248  	}
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1249  
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1250  	set_new_dnode(&dn, inode, NULL, NULL, 0);
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1251  	err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1252  	if (err)
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1253) 		goto put_folio;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1254  	f2fs_put_dnode(&dn);
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1255  
> 93770ab7a6e9631 Chao Yu                 2019-04-15  1256  	if (!__is_valid_data_blkaddr(dn.data_blkaddr)) {
> 93770ab7a6e9631 Chao Yu                 2019-04-15  1257  		err = -ENOENT;
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1258) 		goto put_folio;
> 93770ab7a6e9631 Chao Yu                 2019-04-15  1259  	}
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1260  	if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
> 93770ab7a6e9631 Chao Yu                 2019-04-15  1261  						DATA_GENERIC_ENHANCE))) {
> 10f966bbf521bb9 Chao Yu                 2019-06-20  1262  		err = -EFSCORRUPTED;
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1263) 		goto put_folio;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1264  	}
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1265  got_it:
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1266) 	/* read folio */
> d342b7adad71e5a Matthew Wilcox (Oracle  2025-07-08  1267) 	fio.folio = folio;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1268  	fio.new_blkaddr = fio.old_blkaddr = dn.data_blkaddr;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1269  
> 9bf1a3f73927492 Yunlong Song            2018-09-18  1270  	/*
> 9bf1a3f73927492 Yunlong Song            2018-09-18  1271  	 * don't cache encrypted data into meta inode until previous dirty
> 9bf1a3f73927492 Yunlong Song            2018-09-18  1272  	 * data were writebacked to avoid racing between GC and flush.
> 9bf1a3f73927492 Yunlong Song            2018-09-18  1273  	 */
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1274) 	f2fs_folio_wait_writeback(folio, DATA, true, true);
> 9bf1a3f73927492 Yunlong Song            2018-09-18  1275  
> 9bf1a3f73927492 Yunlong Song            2018-09-18  1276  	f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
> 9bf1a3f73927492 Yunlong Song            2018-09-18  1277  
> e0b89d00ea9f846 Chao Yu                 2025-10-14  1278  	efolio = f2fs_filemap_get_folio(META_MAPPING(sbi), dn.data_blkaddr,
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1279  					FGP_LOCK | FGP_CREAT, GFP_NOFS);
> e0b89d00ea9f846 Chao Yu                 2025-10-14  1280  	if (IS_ERR(efolio)) {
> e0b89d00ea9f846 Chao Yu                 2025-10-14  1281  		err = PTR_ERR(efolio);
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1282) 		goto put_folio;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1283  	}
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1284  
> 0c3712423755e85 Jianan Huang            2026-02-09  1285  	if (folio_test_uptodate(efolio))
> 0c3712423755e85 Jianan Huang            2026-02-09 @1286  		goto put_encrypted_page;
> 
> Is this an error path?  It looks like it is...

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test

It's not an error case, but skips to submit bio.

> 
> 0c3712423755e85 Jianan Huang            2026-02-09  1287  
> e0b89d00ea9f846 Chao Yu                 2025-10-14  1288  	fio.encrypted_page = &efolio->page;
> e0b89d00ea9f846 Chao Yu                 2025-10-14  1289  
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1290  	err = f2fs_submit_page_bio(&fio);
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1291  	if (err)
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1292  		goto put_encrypted_page;
> 89c16629e3136f0 Yongpeng Yang           2025-10-27  1293  	f2fs_put_page(fio.encrypted_page, false);
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1294) 	f2fs_folio_put(folio, true);
> 8b83ac81f4283ae Chao Yu                 2020-04-16  1295  
> 34a23525601a16f Chao Yu                 2022-08-20  1296  	f2fs_update_iostat(sbi, inode, FS_DATA_READ_IO, F2FS_BLKSIZE);
> 34a23525601a16f Chao Yu                 2022-08-20  1297  	f2fs_update_iostat(sbi, NULL, FS_GDATA_READ_IO, F2FS_BLKSIZE);
> 8b83ac81f4283ae Chao Yu                 2020-04-16  1298  
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1299  	return 0;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1300  put_encrypted_page:
> 89c16629e3136f0 Yongpeng Yang           2025-10-27  1301  	f2fs_put_page(fio.encrypted_page, true);
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1302) put_folio:
> 0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1303) 	f2fs_folio_put(folio, true);
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1304  	return err;
> 6aa58d8ad20a332 Chao Yu                 2018-08-14  1305  }
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
