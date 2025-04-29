Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A2AAA127F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Apr 2025 18:54:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESEaB7iiXt5ub83XG8uACg0QoFfzzxNF7Drb+TCdwrE=; b=dYp0FXFYU+MIjGVzmCyHPk5Y3F
	DGa33AZ1Wcn8iRvIXHXM2JrKtb2FY1I5KojVPsFh62gqwDzzenBpKYypUHogmPRmn8SaF9kMvZMBF
	n7jFLS6tB7Zwt8RJilfYdcHoey2evFt4j19WPhRe+iQ5x7HL4+aqKo4ABNz1F2MA8154=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u9oDv-00007w-ER;
	Tue, 29 Apr 2025 16:54:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <devnull@nl6720.me>) id 1u9oDs-0008Nh-1c
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Apr 2025 16:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XDtov2T2FZ0Nm152erMm/ITMRes2ZtIRbED66S873x0=; b=IDhrB6B3kV2qsQfC+/iyMafaNC
 PkxgCsPI9a4k76HsqKlXEdshukMUsiuOQDlxeLE/E+BMiez0Hu0Hm9vRuH4c/KzG6nJPY+C2nC2sB
 SNq3Mr2mprpEJkHpe16DxQLL5I7+WaFvLgiqgoVLQteuWuUD2QgXue8WEodlSD5FCZwk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XDtov2T2FZ0Nm152erMm/ITMRes2ZtIRbED66S873x0=; b=TKneSOpPHbg3AEfQ3pNtd0JtUH
 RCVqKDL4a1mUp4ftTv8TNJKkZyqqa8sEB9QkUxtx/wg4PFArrBfJwYmFGY/w45N76IQb12IQ6noeG
 kluM1bX/aQuQDPX/gDV6iPnPxEyO0SoD8BrdtQJQdibq9yWHICLsdpCgbxvVnAwTSyMw=;
Received: from dane.soverin.net ([185.233.34.11])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u9oDa-0004Rc-Af for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Apr 2025 16:54:19 +0000
Received: from smtp.soverin.net (unknown [10.10.4.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by dane.soverin.net (Postfix) with ESMTPS id 4Zn5xV6Q87z1CQT;
 Tue, 29 Apr 2025 16:53:50 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [10.10.4.100]) by
 soverin.net (Postfix) with ESMTPSA id 4Zn5xV2KzmzBk; 
 Tue, 29 Apr 2025 16:53:50 +0000 (UTC)
Authentication-Results: smtp.soverin.net; dkim=pass (2048-bit key;
 unprotected) header.d=nl6720.me header.i=@nl6720.me header.a=rsa-sha256
 header.s=soverin1 header.b=Cf+BDzyo; dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nl6720.me; s=soverin1; 
 t=1745945630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XDtov2T2FZ0Nm152erMm/ITMRes2ZtIRbED66S873x0=;
 b=Cf+BDzyouc7NRXoaro4rLRejwiQhzOefGLOsF/hch+lQuAzLE2ggbMluzwi5LV4d34+Y+N
 GaDSLKM7Fr7CQnMetLf2tIMHi1Ctmszcw33Q5gjA255Yd27v9bRUMapetBbp3k8COhJDT8
 3mCKveNe66ItV2OM18cddR0klllE/FOc5gKVH9UItEOyNObzit5UdB2iuT04qAMPdDb8cw
 zVHAVDM6DdVpL+4kjkNkTe/xi6zUJFSIZ7PUEwB9h5AdnLYtuyxkp0ccnmsZJh97W4ugQ0
 f8IMbxa89DfpWj8ahH+I6v404hjsYj3bNlDU6vmenoDYXjv7A2M4MQoWDKEFiQ==
X-CM-Analysis: v=2.4 cv=UsCZN/wB c=1 sm=1 tr=0 ts=6811041e
 a=gDLi7OiDnwTL5vi9sMxOwA==:117 a=gDLi7OiDnwTL5vi9sMxOwA==:17
 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=LlZiwBlNTmBLxTRSp5MA:9 a=QEXdDO2ut3YA:10 a=u4TTkWy4iRif133gqW0v:22
X-CM-Envelope: MS4xfMjE3eFah/MnJAgsTp6FlylBRzHUzc+jWV3RyMBqV66ljxAlTw5uirvmyHsxCdM4y9E+/mn4XNezqi5iXHDZVVYc4pFKo4URJbgSXqouDKjpWcLUW8E6
 cTlmuxyeeGbtj0IjRekgqTKkX22HooRUTHT7tC1804WHrwx4P1dkLHRsNjNHF7KFzDd63085eLAhM12oxX1oflkzWObRCc4t3F1Ls7fi68pvI25Jp9RLEqxT
To: linux-f2fs-devel@lists.sourceforge.net, Chao Yu <chao@kernel.org>
Date: Tue, 29 Apr 2025 19:53:49 +0300
Message-ID: <5173683.GXAFRqVoOG@nl6720.me>
In-Reply-To: <da5d8c00-4835-4635-a5f5-8610dd79a579@kernel.org>
References: <20250425013623.918150-1-devnull@nl6720.me>
 <2375737.ElGaqSPkdT@nl6720.me>
 <da5d8c00-4835-4635-a5f5-8610dd79a579@kernel.org>
MIME-Version: 1.0
X-Spampanel-Class: ham
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Monday, 28 April 2025 10:33:18 EEST Chao Yu wrote: > How
 about printing block size of f2fs as below: > > output of mkfs.f2fs: > >
 Info: sector size = 512 > Info: total sectors = 16777216 (8192 MB) [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [185.233.34.11 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [185.233.34.11 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [185.233.34.11 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [185.233.34.11 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1u9oDa-0004Rc-Af
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: prefer physical over logical
 block size
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
From: nl6720 via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: nl6720 <devnull@nl6720.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Monday, 28 April 2025 10:33:18 EEST Chao Yu wrote:
> How about printing block size of f2fs as below:
> 
> output of mkfs.f2fs:
> 
> Info: sector size = 512
> Info: total sectors = 16777216 (8192 MB)
> Info: block size = 4096

mkfs.f2fs printing it would be nice.

I'm still confused by the "sector size" in mkfs.f2fs output. Is it simply the
drive's logical sector size and not a fundamental part of the file system
like with xfs?

nl6720




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
