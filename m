Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2115AC019
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  3 Sep 2022 19:38:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oUX6A-0004pc-6q;
	Sat, 03 Sep 2022 17:38:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <konishi.ryusuke@gmail.com>) id 1oUX61-0004pL-QR
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 03 Sep 2022 17:38:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T9PB00G8n49mkQ5GqTry0cp+XpHMmRJWkRcveZs969s=; b=UBF2EV8pfj9bIeTVBqkbGGeBcb
 m9q2uB5KVo9ZJkQKImKtJc5ya74uaUTquivQ50vZB789vqMXsK+X4dCZB3iAoZve2xE35HDXZV+ag
 FzxTAP8232kAEFtVW50Wky4E/8aIyloxNEBU3pQJeVFlkFFoCUQYzK/4gHHriz/0BmVA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T9PB00G8n49mkQ5GqTry0cp+XpHMmRJWkRcveZs969s=; b=NT5rhnr7Iw8genzSlnSE4DSGQm
 XlCwaUj/t57Nlf8x+CWZ02XvWiPzF6UvfuMDUJWfkAom3kstK2jXvYfuZaMv4VaQ3r2AWmlgHQCbe
 JdM6UUbt32y7sSzGLBt+Yhr5WD4P5ijY0AfpbSiaFbiZyZXnVgtWQ/h9DTqiLQU4zDOA=;
Received: from mail-lj1-f172.google.com ([209.85.208.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oUX5r-0002mv-Cy for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 03 Sep 2022 17:38:17 +0000
Received: by mail-lj1-f172.google.com with SMTP id w19so5230039ljj.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 03 Sep 2022 10:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=T9PB00G8n49mkQ5GqTry0cp+XpHMmRJWkRcveZs969s=;
 b=fIOMCu7AITN9Pt+nFN8BJTaa3K5P3d8RThC1MmB5xW6+aCOf4ziM11dh3PVY8ChogI
 2In7ghfavyCyWtgzUXJdWJbLcoFt8im2w1QA4Z8PA+4nH1IpLvWqzc4K3XXoKDtzZut+
 zrPXw4Xgu7XAc/zA8NHyqWGScGc/Vw+ZfkvXQsEFQsWc2nQpj9tj4wlMemyYzJexkbQZ
 tGfwIBaPTWxhz6U3HENtbDZhuNci6vVbLotA4cnZW4d6tLzMaxSeSrJVmoSXVaGAym04
 0TdYH9bByMpa7AqY2/rQEU0ONx3kmD/re/WCnYtxpF1wiZp12OHS1//jc0Wu8MCo7ffF
 I/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=T9PB00G8n49mkQ5GqTry0cp+XpHMmRJWkRcveZs969s=;
 b=2OYQ7a2cWcGFGqcGaSUKxTfahLn//4VVn5o7PA1jOr5roNQjQkg5hBNwJ2R/pWYiXF
 RV9vHo+IIDRHoDd7yOEJ4+Dz5GGYaG892MSgwqKK7Qm+IMqjlmanpwH7wfWc8hN/ruCw
 pTC6kgufWH1RDRDWtFnc46PoyZ+rJKqlK5C53qUUR341kkRGNxmb0FsX/0o7Qx8105iy
 Cv9cZv08lw/JFZULDJIfMXqYEXYFtaKCzq9Gcev0CU+/O9MqCDHYBH/5AO5fTzYQac8/
 1NJFamgMKfmw3z+9XLqLWhXWvDmo+ojF77EJU6G7k/xefWFnIGwNNqoDu4gU1z92FP8N
 qLYA==
X-Gm-Message-State: ACgBeo2QfhcBdZD5vWCo8JlrgJbQVaSi06cDe6A5PzmOemAWGI5rPEdC
 AzhehD4Gs5nWXyXJbqM+toWJUaUIkmP2dwCOE64=
X-Google-Smtp-Source: AA6agR70Jzdv99OIWtBI+Fq39YHvU0oO+xeoqhKJN9rejAsxAabkcRwmiauhY/c5RKQZKtQjTgpBf1Dezn5qMhA8Xac=
X-Received: by 2002:a2e:8541:0:b0:261:b44b:1a8b with SMTP id
 u1-20020a2e8541000000b00261b44b1a8bmr13288406ljj.46.1662226680495; Sat, 03
 Sep 2022 10:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-20-vishal.moola@gmail.com>
In-Reply-To: <20220901220138.182896-20-vishal.moola@gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Sun, 4 Sep 2022 02:37:43 +0900
Message-ID: <CAKFNMon3fuhwv32mtP_yV1agLUQkOePOfAN0yBH2X669YgonCA@mail.gmail.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Sep 2, 2022 at 7:07 AM Vishal Moola (Oracle) wrote:
 > > Convert function to use folios throughout. This is in preparation for
 > the removal of find_get_pages_range_tag(). > > Signed-off-by: Vi [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [konishi.ryusuke[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.172 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.172 listed in list.dnswl.org]
X-Headers-End: 1oUX5r-0002mv-Cy
Subject: Re: [f2fs-dev] [PATCH 19/23] nilfs2: Convert
 nilfs_lookup_dirty_node_buffers() to use filemap_get_folios_tag()
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

On Fri, Sep 2, 2022 at 7:07 AM Vishal Moola (Oracle) wrote:
>
> Convert function to use folios throughout. This is in preparation for
> the removal of find_get_pages_range_tag().
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/nilfs2/segment.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Thanks,
Ryusuke Konishi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
