Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98304E9F81
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Oct 2019 16:51:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a29MNP/JFEZRNtuQHB9NjLi0ADr4iRGhpfPwgoLkPZk=; b=hASr6sasDmJCvxWkvtyTGqv3z
	WVO67H6EpTOp4M69ya6Sn89nbiadG6G4zq3nMaV7jWPrQZIxh/I7TgF/ABSRRgjgeUx07DjIlSl3h
	cQPfsB6l+rh++T62PAcL3BUnvXJ5GhvRf6ZoX5yg9h/Xpw/rJNZoLOXkw0AgCm78YNmbA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPqFP-0006Zw-Un; Wed, 30 Oct 2019 15:50:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@aol.com>) id 1iPqFN-0006ZN-U4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 15:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tlzW+EHXjriGMcNx2q7rBODiO5QJOtbDYR9mIItAx7c=; b=WjC5zdL/piemi66yrgcXKpiLBP
 /ejtXA6kr1fEiiIIrtO9YIil8J4yJuz0lvnPpdqGELMo+XYna5vs2fBFCErnpApriqv30KCotqPVZ
 VQOFZ7rDHxPo3RkvX0+YrfLtj9GgNxBgRuZMxdb+9vSLHvip0PYS9DfXhtR/h6zkD0rA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tlzW+EHXjriGMcNx2q7rBODiO5QJOtbDYR9mIItAx7c=; b=FowTLe77qk+mWOef5IOA+vh66Y
 cpFS2yLoo6xBA9gxxT/33BZNbJeXxsSPadfDdkEPEo2m+lxD5dS3pW2pFz5EMe7EF41Tx/hysPqmJ
 W5ux/hIs+2UO13OhwtgtOjikWEry1epWNZk9+NP6eVbxeYbjhJZ58S5B8I5CQBS+xhBs=;
Received: from sonic308-55.consmr.mail.gq1.yahoo.com ([98.137.68.31])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iPqFM-00B1Nt-6x
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 15:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1572450650; bh=tlzW+EHXjriGMcNx2q7rBODiO5QJOtbDYR9mIItAx7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject;
 b=PxRXFHyq1BwiPdfBCGkKlBIYlzsV/0JFMaOvTMvltrSJynguwBjBs7AkNjF+0/9tc97g3hhMCH/YXfA4n8rnZCm09eIomwM+iC4V+nUs7Pp+1KoWWCUWAkKM89LZBOwfetEXoQYH9haIJbFDq3emBaM7br9SdLUZGZVAo+CTeq4QbbUrJ8fBGFOzE1h9b3xy6o+H2NjaCZLd+qiqnsikTXSRQVpHUCZga3N4+Bdd17FCbbwCsDfJ6ZZoq5Lxm4n+/TWPib+Re/tW/LbqBGXN2cyZv0XOSofNp4QCBpA5JpI1Z3J5nwWmWvNccsJjm3B3FnyMed5agi1tRAoHtvIChQ==
X-YMail-OSG: HIJd13kVM1k4sA98h6t_XGpmpEp2jWNj1U_XV4n9OX8AN520dD71uJ8PHv13D_2
 omE8WRCjHn2967vQv6JzS0UQvmrmTABhtz6ArxefHcIfykBA8jAEENwHE8KAOALswyI6xDB04TWw
 xMPOXBf374r6q35M60hA93Y0HJGpQY.alMyw6IG4Xn8rGK7hs8sC1kBz.jBJ8yQHYPN7qcbE.9WA
 hH.s3tJQM6M8ACyYaL2xKXG6iZ_1JkVUAaJSBTSiFpijnnAliKPJX2Rj4QIShn6aqLwaJOWk21vj
 1wVoKWoOJlq.CqsKW_nl4VwVwA6.Um2Whv7JJ4d8_N3l4MkHWbKX9ztRdYjbdq7RepB7Wi1KPA1z
 R2orOR3UY_cxKJALXVe6h7b2XxmzlVMzbHWmvq8wrUXchPz0SYrbFsC.2gCLV3jNcJHzwZsTIFkO
 yK4eiFSoIOc0KgoMWxbzdFYJmIuWgHkI8ECvE7OXPSOH16aOm7MFUIbjEyZNGkXhrlaZZl4rrjj9
 r3eJkJDhL98V_zFDSqG_lMbTf6mNh9KcdENQUmTeIrfTqSqy8GoeTvR1qeXRG8KFu.ww9_ogRZjz
 0kf3mcqo42r05UCCwsGep.4zdIUmryoimEOz6Zd0bdND3jslLc5_1Y8ADEfwJzfyTd34XqVS5L3Z
 bOwX2xusZjxw4w17.rnBBHXLmr5prGlcu5.UssPW4NXC.lkwUN39Q3GTIas1VGO8Xbo56YDnvyAX
 DeJc6Tj_EqzdW.YVfBLrYct2lqEIBpIhl9puQ0Oksx9F5RiQ1y_xRgd_SqGlj6b4vcECOrZ4my1r
 v9.ca5Br_axLga54rozxFcp7fIXqo5gIwFK_ek2fLTnvWGWV.EWcG.ggyshNL9b6LM_fXHbZdMjT
 S_A0qQV2QvWBnY8GAjatPCNxgae4Hd8Iauw8Xqia7qfoZIf2J_dhqazdSyeHSGRD7fX80x7lp7O1
 D7EO33CSUhEllw7EUu8Zi9a6rTDLbrLaAGFdwaedVb_7J_5K.9jyFKt7vARtP4ybn7U2Qn_wr.zv
 8hHxG69aQSusZpFtKIDCoICNsPZKbbw_RPI32wmSvnGBFBH0fsGNANC9bAobaM623daFV1GOCamV
 f8XfQ21vn1mkUsR6RCVNwMuHxlSSB44jYQsnwhtc33zSX29N9wlpo54zbXoj.aELxlrPC7YhaJu1
 YlLlVO6DgLja30t54lFBbj6V1j5k6EcBDQ1XLqC0aNoI0rXtZQRYBPL4kNdW2R5E5rRrr8nIUrdV
 .akd01OnBIOijzH9Hy_GSuDLg6i0scWI7MokVOSHS5Ll_fdrx2xQz.rFA9fGeWaAkMgxDSs8wHWr
 R8LZxzmW34m0mgMDRWVEFwpgh55_JjkHl2ONqcZMpN7WEOMGgOgiHJ2qQcsZzrwiO.80SS0zYA6E
 -
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Wed, 30 Oct 2019 15:50:50 +0000
Received: by smtp419.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID ecf34bf87d460b3002b31f8cc4759825; 
 Wed, 30 Oct 2019 15:50:47 +0000 (UTC)
Date: Wed, 30 Oct 2019 23:50:37 +0800
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20191030155020.GA3953@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20191030035518.65477-1-gaoxiang25@huawei.com>
 <20aa40bd-280d-d223-9f73-d9ed7dbe4f29@huawei.com>
 <20191030091542.GA24976@architecture4>
 <19a417e6-8f0e-564e-bc36-59bfc883ec16@huawei.com>
 <20191030104345.GB170703@architecture4>
 <20191030151444.GC16197@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030151444.GC16197@mit.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailer: WebService/1.1.14593 hermes Apache-HttpAsyncClient/4.1.4
 (Java/1.8.0_181)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hsiangkao[at]aol.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [98.137.68.31 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iPqFM-00B1Nt-6x
Subject: Re: [f2fs-dev] [PATCH] f2fs: bio_alloc should never fail
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
From: Gao Xiang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Gao Xiang <hsiangkao@aol.com>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Ted,

On Wed, Oct 30, 2019 at 11:14:45AM -0400, Theodore Y. Ts'o wrote:
> On Wed, Oct 30, 2019 at 06:43:45PM +0800, Gao Xiang wrote:
> > > You're right, in low memory scenario, allocation with bioset will be faster, as
> > > you mentioned offline, maybe we can add/use a priviate bioset like btrfs did
> > > rather than using global one, however, we'd better check how deadlock happen
> > > with a bioset mempool first ...
> > 
> > Okay, hope to get hints from Jaegeuk and redo this patch then...
> 
> It's not at all clear to me that using a private bioset is a good idea
> for f2fs.  That just means you're allocating a separate chunk of
> memory just for f2fs, as opposed to using the global pool.  That's an
> additional chunk of non-swapable kernel memory that's not going to be
> available, in *addition* to the global mempool.  
> 
> Also, who else would you be contending for space with the global
> mempool?  It's not like an mobile handset is going to have other users
> of the global bio mempool.
> 
> On a low-end mobile handset, memory is at a premium, so wasting memory
> to no good effect isn't going to be a great idea.

Thanks for your reply. I agree with your idea.

Actually I think after this version patch is applied, all are the same
as the previous status (whether some deadlock or not).

So I'm curious about the original issue in commit 740432f83560
("f2fs: handle failed bio allocation"). Since f2fs manages multiple write
bios with its internal fio but it seems the commit is not helpful to
resolve potential mempool deadlock (I'm confused since no calltrace,
maybe I'm wrong)...

I think it should be gotten clear first and think how to do next..
(I tend not to add another private bioset since it's unshareable as you
 said as well...)

Thanks,
Gao Xiang

> 
> Regards,
> 
> 						- Ted
> 
>
 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
