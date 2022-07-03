Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E48645643AA
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  3 Jul 2022 05:15:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o7q4t-0000kf-1c; Sun, 03 Jul 2022 03:15:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao.yu@linux.dev>) id 1o7q4d-0000kT-Iz
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 03 Jul 2022 03:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bOd+tIsRgHs/uTDdfCUKatjMnLlhooxoZSpiezzpmGU=; b=JlAWikLtMkQ/gwRjG+WVTeuQeh
 C/EPifeAMK38MJqAigGqIYFzKppeRdpIuSVDK/RPvWzhl5BY5dSaYps1ZzOrK6NCPdFMzpsoT5OuC
 s+BlZ3qozwZKtJd/hRKME/RwHa4w5E0HDvuiW3tIn/aMrNPNkdt1Zai864QFiHm7nSZ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bOd+tIsRgHs/uTDdfCUKatjMnLlhooxoZSpiezzpmGU=; b=YyuWsEdyFjfaiNHoX2wg96/9NJ
 to0EBU3fGsfS2dHe+Lbl5LIYUYmyDihGSkZS0dWWE3OMCJJxhRaMrHduw2FJ1eoOU8WyPdlofLU1q
 QcjnuNvpl55TWIrt6po2rKNB1S8aOMqDPagi4BrG81pSeYnl0E0hQ4PwCYtPHCU0ezNg=;
Received: from out0.migadu.com ([94.23.1.103])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o7q4W-005N9F-0o
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 03 Jul 2022 03:15:02 +0000
Message-ID: <1ccc7c6f-5136-2180-3fe7-5def006e6b88@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1656816972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bOd+tIsRgHs/uTDdfCUKatjMnLlhooxoZSpiezzpmGU=;
 b=ZitAN9P6PPsPg+KspQ2yi94BYA8a3ZyWn/G1sUp04ei2C/2MVG0713yPERpUzLua+CLOw/
 orT1EzMhu6E4lb9zVMGnawVqMaTJg8wMgDptiN2AJ5dbrO0MjQUa9ZmVrD2eHoCrIlVg4V
 BcubYah3caapF/RU+Gv999QbItJLWIY=
Date: Sun, 3 Jul 2022 10:56:09 +0800
MIME-Version: 1.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20220621200548.3485092-1-jaegeuk@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Chao Yu <chao.yu@linux.dev>
In-Reply-To: <20220621200548.3485092-1-jaegeuk@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/22 4:05, Jaegeuk Kim wrote: > The kernel enforced
 not to have compression and inline_data bits > together, but old kernel created
 files with them. Let's disable > compression in that case. > [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [94.23.1.103 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1o7q4W-005N9F-0o
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: drop compression bit if
 inline_data is set
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/22 4:05, Jaegeuk Kim wrote:
> The kernel enforced not to have compression and inline_data bits
> together, but old kernel created files with them. Let's disable
> compression in that case.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
