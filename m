Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DADB48C1C02
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 May 2024 03:23:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s5Eye-0002Pc-3h;
	Fri, 10 May 2024 01:23:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1s5Eyc-0002PW-Qh
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 May 2024 01:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sVWBe+UCtr26ieFT+OjOkZtu7pLwz7jZ/XZe+StySfA=; b=jNRDFCpOlcVPhGJyyNxwACvejo
 oyiGTBGmW7OxbwP/9PZCdXFKCzzhLMkKfW4p71HxNskirh75X71S/ytSk85QIyC1UBRGam90CIN1a
 YmsojJsOk1dOSpA4v9z+mXB8dDoax/AxTBRke9Qz368p+BqB/hle+6hB+z5MGV+G9NX8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sVWBe+UCtr26ieFT+OjOkZtu7pLwz7jZ/XZe+StySfA=; b=hFuIlhfj+21LAErXz6EYcg/NTE
 WsX3GY4KZsBr2gSzpqovTI4/yPtKn9AvqjmV7jgR/YpRAsXTlmkKSgzmg2DBZd9Zqoa5BV/saCGu2
 vrrw5Oz05D+hDkVYEVR3/FEpd4lRUc17Il3TASKvPQe0TBNIyRFX2i27kFU5WCPhAaMI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s5Eyc-0007Tm-D1 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 May 2024 01:23:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 46D8361E05;
 Fri, 10 May 2024 01:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2BDC116B1;
 Fri, 10 May 2024 01:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715304184;
 bh=2BSE5ByOFeu+q4jWzCWPKaw0K5PB4jxT3v2p/qOgpDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cUg8Be1KmPeWf8iYT9CHHRWHmyGK3bsggILYcXyIZuU9b1otfUIGcUwxDLCLP1Pfn
 Gju43ihgPJZPZes15IVpv5xYBvx5OkDeaE/D4Q4TqKKvtpp4EmJ5nY4hhhDvche2wV
 JjDi7Sjs0jxK0WAvCN2Jo2/vkP3bZPLQbXDlwvEknGjkajsnGPduU2/bEekmdShBes
 8fUcl5Gc29Q/GquUeSPsRrkVWpVLqu7FHdC5DvU3E6+P4Tn4ccsHltCUK1FVqm1OXk
 dQjVpkebQMRPohB2rQ/OEEeogsExmgz/T1ynkuyFpERpTs2/HZ3gfcZQnwr6HYYVWS
 VVBuO6oyZBF+Q==
Date: Fri, 10 May 2024 01:23:02 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Message-ID: <20240510012302.GA1110919@google.com>
References: <20240405121332.689228-1-eugen.hristev@collabora.com>
 <20240405121332.689228-2-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240405121332.689228-2-eugen.hristev@collabora.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Apr 05, 2024 at 03:13:24PM +0300,
 Eugen Hristev wrote:
 > From: Gabriel Krisman Bertazi <krisman@collabora.com> > > Keeping it as
 qstr avoids the unnecessary conversion in ext4_match > > Signed [...] 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s5Eyc-0007Tm-D1
Subject: Re: [f2fs-dev] [PATCH v16 1/9] ext4: Simplify the handling of
 cached insensitive names
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
Cc: krisman@suse.de, brauner@kernel.org, kernel@collabora.com, tytso@mit.edu,
 jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Apr 05, 2024 at 03:13:24PM +0300, Eugen Hristev wrote:
> From: Gabriel Krisman Bertazi <krisman@collabora.com>
> 
> Keeping it as qstr avoids the unnecessary conversion in ext4_match
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> [eugen.hristev@collabora.com: port to 6.8-rc3]
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>

Reviewed-by: Eric Biggers <ebiggers@google.com>

(But please change "cached insensitive" to "case-insensitive")

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
