Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E15CB3FDE6B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Sep 2021 17:17:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mLRzl-0005eD-Ay; Wed, 01 Sep 2021 15:17:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mLRzj-0005e7-Ig
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Sep 2021 15:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/GGmOUmP/HWfyFYlF4fSiVjkuTnkEVuMct1cxrvUQZ4=; b=PnA8cO4JGfJgNNxj0omHv6JOry
 CO03vrcc5QlzhzsyUqxGpfJqHHKZwMDK3s5L2F4hnrmzM4C5Saof0lWCiMmztVyeV3mTVDIj68Kps
 iteRuLbsK1/ta+B8B7+8W+pFD4heSHrRDiMg9N3ovpY8kKbJu0gi1VbPPYgzNsueVqPw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/GGmOUmP/HWfyFYlF4fSiVjkuTnkEVuMct1cxrvUQZ4=; b=Nu2NUDiwPdXVSDFuinejYIcQkQ
 RbTFGCTvJ+lChko2VKkgn7/ZTq7sgGF9b17lQIyS2OaUy4Pb1TjMq5nHIOKHjpCOWX6ck9yJCI7P7
 9y6NThSGksMZ72P36KOIJy7fbgZTe9CtXbHd6MIRWMYNe5qEQHQkvM34L5Mjb8p26oBE=;
Received: from mail-lj1-f176.google.com ([209.85.208.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mLRzg-00039b-9X
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Sep 2021 15:17:43 +0000
Received: by mail-lj1-f176.google.com with SMTP id h1so5549132ljl.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 01 Sep 2021 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/GGmOUmP/HWfyFYlF4fSiVjkuTnkEVuMct1cxrvUQZ4=;
 b=NmEmdHPJEhOBweZo8F+2InfFyID4brlXdOBGB3F9Wn66QGiotlqQzBoHBUKcN9nDjm
 2hWvPwkxOX6dU3PFew4NiENqTCTuHwkE4DzRlNjuidyLBg7iepn6TGXAMlOv9FfcLAdA
 XRKAnrDf3ChNzZSUNf+uhaY7tmRlLTOYa7KhpAaESisk/daem0ShsCimR1i+yJT8m3H/
 s2h3JvJH2wL94PIZ+NMDmB/G1xsym0azMewbFd/wUac7nLlkJftlS4G6q4WbfT10JOpX
 WutEwH912hhtBRuWN7Bt78ZsZwmH5MjKL6iD3oGkz46yq9EqcAgbrKRQmNrtlmfr6VRW
 fF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/GGmOUmP/HWfyFYlF4fSiVjkuTnkEVuMct1cxrvUQZ4=;
 b=MQUcn8xG1ki2X3yHPVUOfBnaRen+OalLvB5CcRuKMotFC3belXh+dj5aMFSLgp2doz
 cQGzC2vvkbl/BU24w7taYx20WpLYlZia5otsWKfY9HnOkGHtiM7JWOePIck8FNUf9J/H
 L6Id+HfTc9VMRyl2mm8s090SpW4r6SF2ngRMdH6E4WKc2g2NIHNGkMteNoJYkuJeAI+i
 ILQ0/YDXUZveTKE1CUBBd24aRcynQ42U4KfIUEVfP7xkuj5+EKbgAS+abPL0Q444mcwQ
 Ly9in929Hv32yD543d2qCAtIdaBTagnR7RPIo4zR4gHIsHm3ChmPXXQWgx+3K/PVDPLe
 alrQ==
X-Gm-Message-State: AOAM531zPK/hfp1/rbCnNs6LqdqE1dGnZXsrkgBl8xeFqEm2LWs3Adpq
 6/4aIh5Inq8mS5G8TC8tBkLWISR0E1YA0gqASeh1wJ3ABdc=
X-Google-Smtp-Source: ABdhPJzGhbYmqggX6Td/rXLB0q2ecWWWJ4iiAUmGvOSrF2WPKOc+BlXbemEYM8qOQ2zYaC4yHgAKLxXQHtw+3qVGcBk=
X-Received: by 2002:a2e:9296:: with SMTP id d22mr110958ljh.413.1630509453492; 
 Wed, 01 Sep 2021 08:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210831051037.3108944-1-daeho43@gmail.com>
 <33e7e327-5318-e30f-4419-42497fe90b31@kernel.org>
In-Reply-To: <33e7e327-5318-e30f-4419-42497fe90b31@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 1 Sep 2021 08:17:21 -0700
Message-ID: <CACOAw_wyLX_mnnPV0vWeAqTtEDx_bhG2c72jq6YmjQGOgtVLeg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.176 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.176 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mLRzg-00039b-9X
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: introduce fragment allocation mode
 mount option
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

>
> if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_SEG)?
>
> It needs to randomize position of next segment only in fragment_seg mode? IIRC.
>

I want the randomness of segment allocation in fragment:*_block mode
to simulate real filesystem fragmentation.
How about just using fragment:rand_block for the simulation. I mean we
can use segment randomness for fragment:segment and
fragment:rand_block.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
