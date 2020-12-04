Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EA22CE754
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 06:19:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kl3Uy-00083x-95; Fri, 04 Dec 2020 05:19:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kl3Ux-00083p-6m
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 05:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZcMp6lx+FxRyZw+uNwbn0Cpe82tf7rQHjfdMl+yvn2I=; b=axCd6ONqYCNDeaqHIHKgPpFq02
 NVmKp/j6NpYVT0fEBIU1PIYNd/iCtpfVT3g993j5Yx3ceQ/P3BXKTKpXC8POIT+/UHpN2pmLKYJjI
 KNH5eIFV9Bi0A5eQZtzU1U/06hurmfdIquKj/Hoxpcp2JRMCrNr1nEurPMfMwPylTNws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZcMp6lx+FxRyZw+uNwbn0Cpe82tf7rQHjfdMl+yvn2I=; b=QoIwONqH4CBVIefqKEhJpN8flE
 1yC8RY6d0nCxY0wXDO9k3woz+WfVFDvBa3hGx85EnSqZvazUr5LlyyZhg+zlkMzzuY0qhfTBuqcmW
 qRQxQqaMSrwHQgR8l+i2nbMq5unr6h5tVG7/9DxLzzhrTw3f3CK15sXxGBY8EzpQO5oE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kl3Un-00EUQ2-G8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 05:19:15 +0000
Date: Thu, 3 Dec 2020 21:18:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607059135;
 bh=NTtFOG1GQx90cr9hCi4Q6/ZGEbwo1wz4YjAws8quq+Y=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=KeJEBuIP38Tw8Wdzo5/eCldxIhwTUc8sNMSvPvgbFt2S20Y9dxy9kLd62M+gHvkxo
 O8HVGaq6anDcfW50A8aEF4n/ZpmXLzLoUc4Zzs7+lKhKhxMng0nuuL9adZeytp/OSB
 LyEAOjTfLbu3fhCdYgGoje7zBqi/3efX5GzhWskoDMWAJVlMbb0qhM8VBslu194Sma
 4XmZXW8sf7Ysvsv2QL2KYcLZ1PynVMnTRL047LF4GgZFZMt/Wkszc3acv8bt1U89WP
 nPI79ftT1h9Au9Z6v+kyfAXWUKIEZfx99g53LYngTW0GWixkycvUpetG94nhsFCfTB
 A2njq7xqQhaGA==
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <X8nGvfEeTDTLa6FL@sol.localdomain>
References: <20201204005847.654074-1-daeho43@gmail.com>
 <X8msy1T8uqZ4Z/iR@sol.localdomain>
 <CACOAw_wTFsfgLfrWKRoM1o_HQorJE-=2ztZftQTn+comcpmHxQ@mail.gmail.com>
 <X8m0qbd7rvQyiwOt@sol.localdomain>
 <CACOAw_y2HRE8CDk-HAjA6w_HzGJpRpivPY5zKRMC4_SNYTnTGg@mail.gmail.com>
 <CACOAw_xzKjZcpVTo3aj5sJUQ_BjLr=5ZhnfuyFwYerpyzZu+aw@mail.gmail.com>
 <X8nAParf9GW9LaGV@sol.localdomain>
 <CACOAw_wOShYf23Y0txs6Fk_Qq9JGEjXGRb0MzMxrBxJpzCfLmA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_wOShYf23Y0txs6Fk_Qq9JGEjXGRb0MzMxrBxJpzCfLmA@mail.gmail.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kl3Un-00EUQ2-G8
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix race of pending_pages in
 decompression
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Dec 04, 2020 at 02:00:34PM +0900, Daeho Jeong wrote:
> I think I don't understand how verity works.
> Right after verity is enabled on a file, is the verity logic working
> for the whole file data area?
> Or it's just working for the data area which is updated after verity is enabled?
> 

It's for the whole file.

My point is just that if there is a bio that saw that verity isn't enabled yet
when it started and therefore STEP_VERITY didn't get set in the
bio_post_read_ctx (or the bio_post_read_ctx didn't get allocated due to one not
being needed), then the filesystem shouldn't change its mind and try to verify
the pages when the bio completes if verity happened to be enabled concurrently.
It's too late for that bio.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
