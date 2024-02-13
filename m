Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E4A8533D2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Feb 2024 15:57:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rZuE0-0002l5-3C;
	Tue, 13 Feb 2024 14:57:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1rZuDy-0002kz-1h
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Feb 2024 14:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k6AuuXM98Ge4K9PV/HqA578dL5VO3MaI9ep7O1YEk/M=; b=DwzZPgxp7oaqQStLcuRE4BgDb2
 T/Wyma8vDMH2fp7/qT3eqxJFBhYNx86te66vP6HrCqDQSgv/uCtXZGq0Kljk1wmbZrau/jHdtPg6q
 PZu4LXfXT4LjxUy77bMonxY9F5sl94htxe8hhwtukGTjeWCUJr17RrVM/lWPxyy63gOc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k6AuuXM98Ge4K9PV/HqA578dL5VO3MaI9ep7O1YEk/M=; b=MadqbuymZ3GExOo7KWwWA7g/mt
 qvvoUqav3J+1lr1AnDybsgNXzESZpIQPp1hIRt1CU2353Ip405SkS8zai/MKi7BNXBo482AWn1M8X
 30xl+VXzt82Bry07eD2Xlzt262hq1hCATjn+kOFSIltMqayAiU/zSvc2QBJa0vC0KPPg=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rZuDx-0001q5-6l for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Feb 2024 14:57:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 29BEECE1CA0;
 Tue, 13 Feb 2024 14:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8E3C433C7;
 Tue, 13 Feb 2024 14:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1707836237;
 bh=I3cgIB4It1MqQprbSzFE4+Lf/lqV5JUhGmN4TYaSTuM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qIO4gYTFZgRqso784204fbBphcuVdCKXzKeTaUw9zhIwXpP+8rf5uNOSkkZ1pU+Kq
 U4us3gpMK5/3C+h8kaUQaxNUIhra11KD3mqYaSAk3MKjzLvljLnUOBGWGmQRRax3hN
 Ftnk8Qs1POrxTk6Jm/TXI3j4X4ttWdj7oI1AdxDg=
Date: Tue, 13 Feb 2024 15:57:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <2024021307-clumsily-worrier-10d7@gregkh>
References: <20240212160530.1017205-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240212160530.1017205-1-chao@kernel.org>
X-Spam-Score: -3.0 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Feb 13, 2024 at 12:05:30AM +0800, Chao Yu wrote: >
 From: Sheng Yong <shengyong@oppo.com> > > commit
 c571fbb5b59a3741e48014faa92c2f14bc59fe50
 upstream. > > This patch adds a helper function to [...] 
 Content analysis details:   (-3.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rZuDx-0001q5-6l
Subject: Re: [f2fs-dev] [PATCH 6.1] f2fs: add helper to check compression
 level
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Feb 13, 2024 at 12:05:30AM +0800, Chao Yu wrote:
> From: Sheng Yong <shengyong@oppo.com>
> 
> commit c571fbb5b59a3741e48014faa92c2f14bc59fe50 upstream.
> 
> This patch adds a helper function to check if compression level is
> valid.

Now queued up, thanks.

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
