Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BCD5773BD
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Jul 2022 05:35:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oCv3z-0004wA-8a; Sun, 17 Jul 2022 03:35:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oCv3x-0004w4-PL
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 03:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kFM+Ai8az1V/sUnlsueli6DY83xw97P9Tqw2sP2f9pI=; b=MqWpcl8CbWYfL1wXU6Y0eKBwck
 CFGlKZuTWy/tWn2Z9i0yKoNpLyPcXbHKi/8QB402/L0s1x6+VFRX8FzM9No+di312UjIGPJ2yYBXb
 qhot0nGbJd7mEb3l9jgxVsLdlj+E3jlxNibm+Jtq5q1Z/02gf/r91DAWdko5Bm6Iej0I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kFM+Ai8az1V/sUnlsueli6DY83xw97P9Tqw2sP2f9pI=; b=VG0JmCSLSWxb+wvvY350Hg4QWB
 /SWQbCwHHuQKS7aJ5AMDHJjOgJiO/xsUCyw+K+ssCSGCRrw2Re8WQSB7ar03WkQ5WQO9RzgSw6frh
 LWkTwM5WeXW95GCGDzWmonVUpn9wJqSgym17NUNXN+MXIcKH3J3Hl0uLVHxB/Y12kfk8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oCv3w-0005JR-Rs
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 03:35:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8DE0EB8097A;
 Sun, 17 Jul 2022 03:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24034C3411E;
 Sun, 17 Jul 2022 03:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658028913;
 bh=NXIYEBW2Gnf27WpptrNKLek8AZmk6TkiD4JJeNNGi7Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XlUS65va/gDTPKBthdj1eiqCxtu5GqKkkGsoGKiIeYSBNEaioDHUJ2QejH5m06w63
 rMLQ91jmZkqGMjBgYgtkFFymHMwa+Q7HwalcIHB/bn07wW3qUmXDma5N7il7bBSLwx
 mgtXcn7Vu3Qhff0hZAzsJcmNLAx31N55NhjoOMYGkvmoTNUP2B8PXbosdoxDZD7ySD
 ovFnKcDPx6Iw6EMuiu8WSzRo910HlG+vF0Y9ZhfDhAxBtbACPVyqOJsvADwjIe36eb
 ILvmyYi2k7gfg8ayv0DxRN80duESn76MJ9ojVpr1V4WLHYBtPKnqptAWMnJDEKBAcL
 bItyUGKA74KVw==
Message-ID: <055e4fa1-d17c-e2af-840a-8ca5ad58333d@kernel.org>
Date: Sun, 17 Jul 2022 11:35:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220623181208.3596448-1-bvanassche@acm.org>
 <20220623181208.3596448-2-bvanassche@acm.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220623181208.3596448-2-bvanassche@acm.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/24 2:12, Bart Van Assche wrote: > Fix the struct
 f2fs_dentry_block definition on systems for which > PAGE_SIZE != 4096. This
 patch does not change the struct f2fs_dentry_block > definition i [...] 
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
X-Headers-End: 1oCv3w-0005JR-Rs
Subject: Re: [f2fs-dev] [PATCH v2 1/5] Fix the struct f2fs_dentry_block
 definition
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
Cc: Peter Collingbourne <pcc@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/24 2:12, Bart Van Assche wrote:
> Fix the struct f2fs_dentry_block definition on systems for which
> PAGE_SIZE != 4096. This patch does not change the struct f2fs_dentry_block
> definition if PAGE_SIZE == 4096.
> 
> Cc: Peter Collingbourne <pcc@google.com>
> Reported-by: Peter Collingbourne <pcc@google.com>
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
