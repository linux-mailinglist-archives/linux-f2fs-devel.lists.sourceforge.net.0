Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5BDACD532
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jun 2025 04:06:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BbF5gqeYZ0shrULJ4qzjz57LWWdUkdk4gZ2sah7UylM=; b=LOLP3gJKHswcUriWCprJYsA7f/
	yDsa6BulYSYaMQbcaYd8oIN0cKclhXFtrAGp7NVdUPruHgJMVmDif2/oB/cjYap3OjS/ULKNkO8gP
	L4BPgPa1RnzQp9O0uGeCJJT+xeopjoOajgzjGt1EttNJcsLZk/JhHRPFKn/5WTeaIfBQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMdWN-0004FL-69;
	Wed, 04 Jun 2025 02:06:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uMdWM-0004FD-6r
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 02:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cLdoIoto4bJZtb3NgyHNhWyzhWqwMZ8ho3IwC8QZQ8Q=; b=cVXSuSitROnvoyDTj5Vod+qi7d
 HvchT65lsCm87MgOmSJ/DVkXLTFwheFe76CJTYtZ27tgsu7ox6irnszazWUX/s1vmTlGJLS2WKr4b
 nDw9dhTR1XgcdGHSfISkJj/G2dbGDWP7h5jQ6xsFiDZ7vHLbTObANDYaYT8L2kLwT9Ks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cLdoIoto4bJZtb3NgyHNhWyzhWqwMZ8ho3IwC8QZQ8Q=; b=K7XrAwxvUFcj6BnjXIlBq245yy
 6qQzquhyb4Sa90zQLckcf3e8S4ikKkFdZ6sxM7wKGUMMtvnXtiOU2lhauAHFpmIm3idrsIygE3THE
 yg0ltijVisWg8mIWFt+vYzvgUZMqgBXKeq5mMt+v4YDwkL8WAKXg3L0nqGBzPGKRt3C8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uMdWL-0003mn-Ik for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 02:06:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CF18F61127;
 Wed,  4 Jun 2025 02:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0AA8C4CEEF;
 Wed,  4 Jun 2025 02:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749002779;
 bh=RhQFs3mXD9Sj4PsJLHxHpnSgQegFAO5+H4tDsaGE2pA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ijD7V+HfKZKE/qUDp6/6oC8UpdkaNZpieLVOJJpNErrvwXJcvjHlN2m5IaFIbRUaL
 uIcI6DEBJ1+bIkV56ocnX2iArhUjmtYi9/X6DpCa4Xhzsg0NLiTEVB7H/hNNbr63mJ
 1rCJlFo6Q5lYZEP9GPEr+ty6fSUfWfDUNadp88Z6aKtQ807euvPSXW7CxkhMwoTBIH
 CuTmW7Ew/35+Sa1PM1bIsl0jEaOkOGQxLTDpz3lHT5t4CJHb3yckeCEN7fSMGO1eTB
 dSNrJm5P+DI1atNGgZQoOiZiMIzUP+sZZwLlxPCDN8aimCPGoy7BO24eGLckLQbn70
 P6HEG9lKrfxtg==
Message-ID: <7e7feba3-a6ac-40eb-a6b4-8b7e78b93fb4@kernel.org>
Date: Wed, 4 Jun 2025 10:06:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: orbea@riseup.net, linux-f2fs-devel@lists.sourceforge.net
References: <20250603135905.13959-1-orbea@riseup.net>
Content-Language: en-US
In-Reply-To: <20250603135905.13959-1-orbea@riseup.net>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/3/25 21:59,
 orbea@riseup.net wrote: > From: orbea <orbea@riseup.net>
 > > With slibtool the build will fail with 'cannot find -lf2fs'. > > To fix
 this it is better to use the canonical method of l [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uMdWL-0003mn-Ik
Subject: Re: [f2fs-dev] [PATCH 1/1] mkfs: link using libf2fs.la
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/3/25 21:59, orbea@riseup.net wrote:
> From: orbea <orbea@riseup.net>
> 
> With slibtool the build will fail with 'cannot find -lf2fs'.
> 
> To fix this it is better to use the canonical method of linking internal
> dependencies which is to use the generated .la files where the libtool
> implementation will know what to do with it.
> 
> Gentoo-Issue: https://bugs.gentoo.org/929070
> Signed-off-by: orbea <orbea@riseup.net>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
