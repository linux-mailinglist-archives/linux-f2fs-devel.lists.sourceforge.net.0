Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C538339B5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Jun 2019 22:27:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hXtYH-0005ky-R5; Mon, 03 Jun 2019 20:27:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hXtYG-0005kq-4A
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Jun 2019 20:27:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JXUPBC4k3x9axAbeHVK507gj2dR6+1+g3eZRBRVvvk4=; b=JDTW2yefU2egc6mkzMuT0oSb6i
 qsLGQiPcKURXWL3l38BUZnjeXdRqmbub5/22TXSLve0RYUm3j0H0PJ72gTpHARnaiPQIRjuPb5NHI
 9CxZPpnSPvNr8rBIgOq/J0jf2nc4r0ZeuGUAi/YUDO34c7aQIRCPkt4/lx68YWbEYRxQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JXUPBC4k3x9axAbeHVK507gj2dR6+1+g3eZRBRVvvk4=; b=Pl5zMpTiVj62wL6dNoXyjyE2Ur
 LdmBficWzI/Lwu3+wbNuSkHPxwiYGvDaos8R0Gv30CpjJUG6RP+T13UYsxhNmegsniqK/Wqtzi7WQ
 4WcFs3CTRjI9GOX/YTF1xNX4vIAuqm/JmzhZSL76mSkJwAD6KsQ9JQEgZTu2oS3sYvks=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hXtYE-004j3V-1t
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Jun 2019 20:27:28 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6147226E5D;
 Mon,  3 Jun 2019 20:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559593640;
 bh=YACgKpOFgCxDQBQxu6GuaZMTCpwytqrSoIapI0FxvsA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KZ2iwBJzMCEBzYUJWSzhzYm/Dn9xLN+S8bzCONqnFDIOmj4s/e3o4w1HZUq5n8sZE
 Sn1k7cooMFd9fhvXV1XU0NnEy8gzSscLlbO5YMOUThIJKOhfzErDxRVgnWs9TjLEq6
 FBmHcP7mW9b83R0zXB/1TW/VLuR0LQ4mFZb3evOk=
Date: Mon, 3 Jun 2019 13:27:19 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Ju Hyung Park <qkrwngud825@gmail.com>
Message-ID: <20190603202719.GC34729@jaegeuk-macbookpro.roam.corp.google.com>
References: <CAD14+f2ckNUv9n-Zb9UL_ojX8=24tYBhT-SsrcpVNogqee2tkA@mail.gmail.com>
 <6bcbb5e8-55ad-49c1-bb77-f7f677ceb526@huawei.com>
 <CAD14+f3NHosrL=5UOBSMbFxQ91x-AuWOj_w=JYkJSnmfDgTkvA@mail.gmail.com>
 <CAD14+f0ZTmmLBXtmHF_Kz23JLSJy+UzpNxwSMV4rvSCse3y7EA@mail.gmail.com>
 <7e1bfa07-5ee8-a276-fe6a-6d79bd9270c3@huawei.com>
 <CAD14+f1+puy4M6rL_SbGt9vej=7LgK+qEjq71_878=oqSvjJ2Q@mail.gmail.com>
 <0f89b0b6-5cc5-6618-72e5-8a2f81947161@kernel.org>
 <CAD14+f1xgYKAnzqLb-ZpzbeskZegGHXbrJ+vEHZe19_Jp3pBTQ@mail.gmail.com>
 <e3303318-758e-b263-f6ed-d55e98bdea78@kernel.org>
 <CAD14+f2XWeWvYXTjKbReJa7uZROvnp_-V419sBkpmWFp5L5BtA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD14+f2XWeWvYXTjKbReJa7uZROvnp_-V419sBkpmWFp5L5BtA@mail.gmail.com>
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
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hXtYE-004j3V-1t
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs-tools: relocate chksum_offset
 for large_nat_bitmap feature
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

On 06/04, Ju Hyung Park wrote:
> Hi Jaegeuk and Chao,
> 
> A little update I thought I might share.
> 
> Just went through migrating my laptop to another SSD and I've setup
> f2fs from the beginning with mkfs -i from the master branch.
> No issue as of yet and the kernel is working fine as expected :)

Cool, thanks for your test. :)

> 
> Thanks.
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
