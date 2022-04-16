Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FC8503266
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 Apr 2022 04:29:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nfYCA-0001pg-7U; Sat, 16 Apr 2022 02:29:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nfYC9-0001pY-GG
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 16 Apr 2022 02:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hvkxHxHnlC7tfrlktfqS64YVUxXB+tPlWOwaatjUT00=; b=HcK+25byr5l0qySfljXGCKc4tJ
 IpKDkHD/7DmBu/KX8SJXDX9bQabXgpoCEx+g0kqusZ+Rhp/I1L2is9mIhUZ7nY+xa07j8pG3It/0T
 WflRCg+5xZMsHNkRZhiAjv7wi/969R7xQWE8iUK+o7l4d9h61WDGvHW+6P0Ct4V3zX28=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hvkxHxHnlC7tfrlktfqS64YVUxXB+tPlWOwaatjUT00=; b=eqXD1q+jxn3cRw5/p8tlKItUKw
 8XhMU5dwry9ALAYOmxRBEoeIAaqbuHHjE5QOFneW0rEs9i55kue+VlZfULMq9jf0CuBqRcQhiHnfe
 nSdg4Q6J/p1j73+SPM8jRvklHA3nU247kvZ0kTmD3zYsZWVVC0KvH5nR264+cmFO+bNU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nfYC5-0005GF-PO
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 16 Apr 2022 02:29:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 836DBB82078;
 Sat, 16 Apr 2022 02:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232A0C385A7;
 Sat, 16 Apr 2022 02:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650076182;
 bh=uUd/Mmr+LuhyFMq1LsPUx9KBDlPY2jN3/XYmm96PzHc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kKdejRF7VlO3kQkyjktX96UX47hHrzVNgIL/LXmp3ngoBfXC3HxgotFjJNnHqgmlZ
 k3nLSsdniN2ACPKyFWFUKOwE24IU3fKN8aM/W06LHPWiMY1lmCIECJgskTqB9RwUOU
 j//fH5jUbQGTnfJpGJUw7mmdKJdgcFHKIOAkojp0ZupHywV23GEAOqbtG5bgxy7TQk
 AKgTXrcmaVPaTnXflmZnPtOjisMy4eYqdTfAgpE3TZKrqN7A+LK2QE6U/K9MXGAjUP
 j0chy/yNhQAMH/evjg4zu2KapVcm/MeNXTMPyexv4vOsAq3z8xRKIhAlXp6aooZlFB
 D5L5L9pmdOyLQ==
Message-ID: <ec26e65f-5e5d-3c99-d631-148717333cf5@kernel.org>
Date: Sat, 16 Apr 2022 10:29:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Dongliang Mu <dzm91@hust.edu.cn>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220415131902.55028-1-dzm91@hust.edu.cn>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220415131902.55028-1-dzm91@hust.edu.cn>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/4/15 21:19, Dongliang Mu wrote: > From: Dongliang
 Mu <mudongliangabcd@gmail.com> > > Syzbot triggers two WARNs in
 f2fs_is_valid_blkaddr
 and > __is_bitmap_valid. For example, in f2fs_is_valid_b [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nfYC5-0005GF-PO
Subject: Re: [f2fs-dev] [PATCH v2] fs: f2fs: remove WARN_ON in
 f2fs_is_valid_blkaddr
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
Cc: linux-kernel@vger.kernel.org,
 syzbot+763ae12a2ede1d99d4dc@syzkaller.appspotmail.com,
 Dongliang Mu <mudongliangabcd@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2022/4/15 21:19, Dongliang Mu wrote:
> From: Dongliang Mu <mudongliangabcd@gmail.com>
> 
> Syzbot triggers two WARNs in f2fs_is_valid_blkaddr and
> __is_bitmap_valid. For example, in f2fs_is_valid_blkaddr,
> if type is DATA_GENERIC_ENHANCE or DATA_GENERIC_ENHANCE_READ,
> it invokes WARN_ON if blkaddr is not in the right range.
> The call trace is as follows:
> 
>   f2fs_get_node_info+0x45f/0x1070
>   read_node_page+0x577/0x1190
>   __get_node_page.part.0+0x9e/0x10e0
>   __get_node_page
>   f2fs_get_node_page+0x109/0x180
>   do_read_inode
>   f2fs_iget+0x2a5/0x58b0
>   f2fs_fill_super+0x3b39/0x7ca0
> 
> Fix these two WARNs by replacing WARN_ON with dump_stack.
> 
> Reported-by: syzbot+763ae12a2ede1d99d4dc@syzkaller.appspotmail.com
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
