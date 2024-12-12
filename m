Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5AD9EEF26
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Dec 2024 17:11:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tLlmp-00064R-5T;
	Thu, 12 Dec 2024 16:11:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tLlmn-00064K-SV
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Dec 2024 16:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iTJEB9fzU7wKbfIiUUbK9I5CXeV6gWJbSWRoN4OaakQ=; b=d2zzWQ5ZDsGFww95k4iIKayKP/
 Th9n7Y31Exc8y01SQ0j3TsZ/KyP2fb9UQd7CJtMGJPbKLeIr5QY+BcUKeMpUaJj0kHTWAts2dmard
 7bAwUDNhVyf/VNtMlA1USDTRZZLipn+BKDLXeE1vM53vaHgjibV2VOAdWdJHQfxqcBMY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iTJEB9fzU7wKbfIiUUbK9I5CXeV6gWJbSWRoN4OaakQ=; b=fLEKA45ZhQoT7YnfeTNuTYZN3+
 dkHUZH+m47ojTsrfiVTTWCCisXn2r/SdeA8LErABsAfo8rBwNCwZ+5EnFI4rsUJFx/qzIsnQGJIMh
 LV9O8w86kOr6006AcFEc+m6RKCnVm1nQDaZvQ8km3H+0YSkZ/gsib419JYGgC06tqIrA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tLlmn-0005td-3P for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Dec 2024 16:11:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5A1BF5C69BD;
 Thu, 12 Dec 2024 16:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E30BC4CEDF;
 Thu, 12 Dec 2024 16:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734019882;
 bh=dZ4VZAM7FcWZqocKTmrpQrhxyIrk8tVMApXVzVdvLhI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kx3uPknHgsY5YLmOlqZ+PYIfqD4j8GA0jZpQxNfBxH+7fhXIHv+aaqrvTMYP1V+/2
 FtOt1kkjWv6xZOuJYtL1ovJfo2dpPpgJP/zfDvvq2UuTSt/V+G8ZJ3pSNQ8LAaADlG
 KDB/nh/gI+5eyUb9NHCOsmzuc1wEv6PQq9ZW+CRZ0XlarK3720M8FBN1B+817yvgCY
 a7JxrLkwLBSUWmq3W4QjavY9iYvFCc5EUXs8bZL6R7wMOUlIKNKVFJq4uQ6MvF4SG+
 FKz1iP+tBJR7obyvb5XZlm6/dZicQRFHEZ1hs5C3OCbiRc8dS/PqYwpJZsn5ijPOgy
 Dn+D5ozW0ArHw==
Date: Thu, 12 Dec 2024 16:11:20 +0000
To: Dan Carpenter <dan.carpenter@linaro.org>
Message-ID: <Z1sLKDtRa3wX2Z9g@google.com>
References: <CGME20240819083433epcas1p3861b773a5b21eea6f0332036a71bb5d7@epcas1p3.samsung.com>
 <20240819083430.31852-1-youngjin.gil@samsung.com>
 <644671fc-b35d-4c53-ae25-356963466339@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <644671fc-b35d-4c53-ae25-356963466339@stanley.mountain>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/12, Dan Carpenter wrote: > On Mon, Aug 19,
 2024 at 05:34:30PM
 +0900, Yeongjin Gil wrote: > > In f2fs_do_write_data_page, when the data
 block is NULL_ADDR, it skips > > writepage considering that [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tLlmn-0005td-3P
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: don't redirty sparse
 cluster during {, de}compress
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
Cc: daehojeong@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Sungjong Seo <sj1557.seo@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/12, Dan Carpenter wrote:
> On Mon, Aug 19, 2024 at 05:34:30PM +0900, Yeongjin Gil wrote:
> > In f2fs_do_write_data_page, when the data block is NULL_ADDR, it skips
> > writepage considering that it has been already truncated.
> > This results in an infinite loop as the PAGECACHE_TAG_TOWRITE tag is not
> > cleared during the writeback process for a compressed file including
> > NULL_ADDR in compress_mode=user.
> > 
> > This is the reproduction process:
> > 
> > 1. dd if=/dev/zero bs=4096 count=1024 seek=1024 of=testfile
> > 2. f2fs_io compress testfile
> > 3. dd if=/dev/zero bs=4096 count=1 conv=notrunc of=testfile
> > 4. f2fs_io decompress testfile
> > 
> > To prevent the problem, let's check whether the cluster is fully
> > allocated before redirty its pages.
> > 
> 
> We were discussing how to detect these sorts of things in the future.
> Presumably a user found this by chance?  Xfstests has two tests which deal
> with compression tests/f2fs/002 and tests/f2fs/007.  But it feels like
> xfstests is not really the right place for this sort of thing, it would
> be better as part of some sort of fuzz testing.
> 
> What do you think?

Yeah, agreed that we must have tests to catch this. One way may be creating
some basic disk images having some possible valid layout to see f2fs can
work as intended. I feel we can put it in xfstests as wel?

Chao, thoughts?

> 
> regards,
> dan carpenter


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
