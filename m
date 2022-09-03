Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FA85AC018
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  3 Sep 2022 19:38:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oUX62-0006Ar-L5;
	Sat, 03 Sep 2022 17:38:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <konishi.ryusuke@gmail.com>) id 1oUX61-0006Ak-Qu
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 03 Sep 2022 17:38:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=umA9pNWUzA7jidUk20/rQkICnueDyRo/bSzQh0Un5OQ=; b=KtBsmggKoNfgNSduuYGn53+YKA
 HbfPQNdlHjR2T4IJPZ88+SB1qwF8sytT7ceSoG5cCkSidL2f0J1uOS/hjBwyqLAerg/C6nWncAcLP
 tfcnMMBM9nyqNPseTGXy02i1u4rOZHxOWmPbhnpvzEaTqEachz1KYBbsdVuUBzNMf8bI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=umA9pNWUzA7jidUk20/rQkICnueDyRo/bSzQh0Un5OQ=; b=FkzHReBilLTeFrTTmlafwzjXOV
 +YDLKVpDg2QCwX7eimp0e+hNawY3g1iMelLORJOsDNGvSxcil5LpvBnxOjymid4wLl6dQItZLAldb
 rfZWU4wvcpjDvEG1HAY9itbiu6GdsQOwA4ndKcj/bHsIG3jFvrK42E22abTzqGnFJ06Y=;
Received: from mail-lf1-f52.google.com ([209.85.167.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oUX5x-0002nD-9D for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 03 Sep 2022 17:38:17 +0000
Received: by mail-lf1-f52.google.com with SMTP id w8so7515823lft.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 03 Sep 2022 10:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=umA9pNWUzA7jidUk20/rQkICnueDyRo/bSzQh0Un5OQ=;
 b=VyzRNIPerqW7I2eLeisbraYtMw+0LYm0zIpPAVWdKSSdHWT/xCWCsp0zWPwXoLJMh+
 goWZU++QcdZPHEow/EbE3MCighBvzGVxClxj+OzcDeg7qVl++yunpPXNQ01tMimk9Nil
 o3xjyWbouw8GEZ5rtVXpCeuyeOvZfUYvXih1iKUWZYS4B5zyr0rs+Qp7tMJsvv3NWnl0
 0RaduV6sEHzrfBKsAnk/xWQvV3uUa4x+tn9f+zR5jX+WCCz3OtcEGQuCgvqQ1qtwV+4e
 nsp1bSuMMrGMJHCG5Ru+yZt8lscOgM/sAHrlB6rqDFjTbCZDBlJetndoMkX0Uq4SD0cg
 qr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=umA9pNWUzA7jidUk20/rQkICnueDyRo/bSzQh0Un5OQ=;
 b=S1XgaF1yDOiCir3d7dEOLjXX54T5L89tiVDv7AYCx0voqLDEsXwMNolIeyAf4a4dZ8
 9ZtZPxhqRXCIz/l0HvhKCnM9rYpkplSvMxCarKshlDaFw00Ai8GY7B0fEUwFBVjwV5K7
 FTsUIEZJaHudEOeX5o0Muf3I2V+iBzXSb71m1PnH9lht6Dd05lccmeIjAPilbQ5XHKd6
 LiBBWpQP7OV9kHeFzceIp5xBM6l1wyEGIcf2StBOd9o41XiwQRBsSVImf36wx/ne/zFA
 I2S60M9AP++jlWq3AVFjwVSOQG/0r3LFRh7Dsa4WII0FfMGkDTZeJiYJxG9Gbat9Qh3e
 O1yQ==
X-Gm-Message-State: ACgBeo0L7vurbrxmo45b8e/+sVnfxUF1ihWe6XgqfzFq3DYCQPN8sv45
 E7Pxa5MSeBQyPyK8PpIANERs0pt2ai53JEAPvJY=
X-Google-Smtp-Source: AA6agR7Hs/+xwEowwLQe+sf+am2LMCCYbskcPVWg25l+bwBfAQC13YuN5kobnm2fSunCnRskcOjFYam9DiwtSafspBg=
X-Received: by 2002:ac2:5510:0:b0:495:3773:f9fe with SMTP id
 j16-20020ac25510000000b004953773f9femr748646lfk.65.1662226686593; Sat, 03 Sep
 2022 10:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-21-vishal.moola@gmail.com>
In-Reply-To: <20220901220138.182896-21-vishal.moola@gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Sun, 4 Sep 2022 02:37:49 +0900
Message-ID: <CAKFNMo=TxJf=47DCnsscu7ZZuDNVi1LDoDHYZo_XscOSzOfi_g@mail.gmail.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Sep 2, 2022 at 7:06 AM Vishal Moola (Oracle) wrote:
 > > Convert function to use folios throughout. This is in preparation for
 > the removal of find_get_pages_range_tag(). > > Signed-off-by: Vi [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [konishi.ryusuke[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.52 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.52 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oUX5x-0002nD-9D
Subject: Re: [f2fs-dev] [PATCH 20/23] nilfs2: Convert
 nilfs_btree_lookup_dirty_buffers() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Sep 2, 2022 at 7:06 AM Vishal Moola (Oracle) wrote:
>
> Convert function to use folios throughout. This is in preparation for
> the removal of find_get_pages_range_tag().
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/nilfs2/btree.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Thanks,
Ryusuke Konishi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
