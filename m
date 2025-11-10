Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC04C45CE0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Nov 2025 11:05:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWXHD7M3JuvFbr4Ev6zE+qBh/cOU0nbrZLBA1tcXuyw=; b=BMRJXYg6Et2ybgMoKa/2x6ZMQS
	ItNcMZGH6Q/iOHpfw1j7kupt62DCvUMAhd9nqXZCFJxP/QH9Mxy5a7wYRutfof9UYNw+DxQ7+9ekP
	P3dJOMm59YY9UMDbdRt6mrpjyGBPj1gAdt6EwWZamoxVReNorz83zDpcWaeSUFTyX7QY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIOm0-0006s5-Qo;
	Mon, 10 Nov 2025 10:05:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vIOly-0006rn-S9
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 10:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=81Bb6gtPPbVqVcr5XW7lb5O2PqOIYI9zfIEC5YTxMh8=; b=Iwar/ALvbHwrW61T6+UVPu7dNH
 ra2TXjTqLvdRYDk3ufIG1IDvniYyfQvOO+C3S243UdMG939K9wmzXfA2cWv4Mh149PCA8NcP4jh2J
 F1vEqTLXdibhqC3StYDEvlHxJ03zOObMp7v+VruG1zAjiOuMOTb9GKMe63MIDvwlKyME=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=81Bb6gtPPbVqVcr5XW7lb5O2PqOIYI9zfIEC5YTxMh8=; b=OW97wM2vaQBDq0UUL1cbz28vF9
 IMC6Vn4fZr4K25o4ibIi9q3WfCahqHnaoL5KBvRVeSc66sY99E0vzHSZHXD6wahXLE3/iLeH12SF4
 PFrJ1UbNGb5kJkWBkF0pSqQhxbDgfS3GwAOcnuL6V+Rd5cXQqcSPdGId8Gmrp4FEnkNM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIONw-0005no-Mk for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 09:40:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4499D40A1B;
 Mon, 10 Nov 2025 09:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD9CC4CEF5;
 Mon, 10 Nov 2025 09:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762767618;
 bh=r3E6g0o2knbA0bTYZWpeOodNDLCi5AyS33Auj/ZEohI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Qz+7vbC35BOvW5NG3MF/ZIPml18WC547dlzeRiFRQj8F8POXVgrMDrVjCy9LPBZpU
 T0+kzGzg1pG7sMtBrm6wNKt7jBYvsAmyPZNMl5t+tswsl1SA0vOfinw61AA7ESFqAD
 Wk8azcrvP1lPrPwIcvmoQbANuH3P79hgJAL6t3p0EYdLlLP9HOG+5avregjeZ4kBhS
 uxWzN6BtB6xHL1sSs89M8zLNdaRoTnlFMoh+a8qWEuAmYNVAdriUvuGAsQdSV5QFcy
 YDm/eszsDeZDPcJmszEdZl7ieQWAhrjLflZb0b37M4ZC+uJ0wKbI5+0PENY/BYGaoB
 39wPo7FURB20Q==
Message-ID: <806c4a8a-91c9-45b9-90b7-f8200ae345ad@kernel.org>
Date: Mon, 10 Nov 2025 17:40:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251110082223.902207-1-yangyongpeng.storage@gmail.com>
 <20251110082223.902207-2-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20251110082223.902207-2-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/10/25 16:22, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > This patch adds a sysfs entry showing the max
 zones that F2FS can write > concurrently. > > Signed-off-by: Y [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vIONw-0005no-Mk
Subject: Re: [f2fs-dev] [PATCH v2 2/3] f2fs: add a sysfs entry to show max
 open zones
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/10/25 16:22, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> This patch adds a sysfs entry showing the max zones that F2FS can write
> concurrently.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
