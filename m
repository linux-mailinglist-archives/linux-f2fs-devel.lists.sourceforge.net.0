Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A348197CC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Dec 2023 05:27:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFoB8-0006qZ-9m;
	Wed, 20 Dec 2023 04:27:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <axboe@kernel.dk>) id 1rFoB5-0006qI-Be
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Dec 2023 04:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kF+V1Jg1BXc6LruEx2QSeT3aVZaOhuhdq7yp1ywFjS8=; b=Hx3hxb/6kp0ZUWRIzeZ/w0Es8q
 AF6mLIt0WdAYslYoalPeOSE7drptTPmowbo+OztRS4fgQUXRJBiY5xwWAnOdTjXCCFUMxa5rpMQwi
 H7Z7/oRb6CHkqVRKtraMTrI/VrIhnjftC5eO06Fjcn8UL+BAjaF86koPQfXzrmHIsH6Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:
 Subject:References:In-Reply-To:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kF+V1Jg1BXc6LruEx2QSeT3aVZaOhuhdq7yp1ywFjS8=; b=FxatE9QUzUEYzDKPBhozddVPsx
 3xOr69NA3LodWq3jXsNOJ9/64YpPEkDUjzzQ7DpjJPI1MB61EGJUvBZ0Di3Dmo0mkV4G/xCnsvxrb
 s6L7OWGwibMzlfBsPFVdLO+a8l72SWQ/dZwO6Emxs9OyRxk8R95fBDeAMymTDjgG1FT8=;
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rFoAy-0000L0-Dr for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Dec 2023 04:27:27 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-6da64da2387so453964a34.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Dec 2023 20:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1703046430; x=1703651230;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kF+V1Jg1BXc6LruEx2QSeT3aVZaOhuhdq7yp1ywFjS8=;
 b=KtaZjsVLz0av0aI5whEbu/YxRGpUkpH8nB5OGmLDQ0HdyGvlbFBYOOjsSLhmbH9wvj
 Pb1cP/bPpeLos1ESlBVp+ZdGCBe+6ImIJCpn9TmMXjn27u+zaA22xdtoy+nJfpBmy8WD
 Ijonl2cOX1DnQj8lv1KpSYKAb5bFbhCGuA0qjl91EmUvzeGshcZGCKmVCJUp5gZE6c36
 e5/jLYF7T1R9U9ayPr/C7nQ+Wh6ByutD+Gk9a/2eN7xKQ/WMgYqYos/B6Z7MYK+uGeSx
 RoLWNxqFB6X6vRHlIVoXq3XCXpXNaXDu+oCRRGZGa4BFdr2mQfQgqu9/puf7mRiGvyky
 hcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703046430; x=1703651230;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kF+V1Jg1BXc6LruEx2QSeT3aVZaOhuhdq7yp1ywFjS8=;
 b=Bv/DkqZMhgQdVeGJ8vMelWIn99t7s5k+yXQe++qxaFVkgx2Nw/B+E5HFK3/K2bxRau
 dUQ4HjiDB5Z4+W7ibcAYCnomw7bFrO7mTdNYVHyAtcjzQjiWhGHfraHBHiyfy4Jd5Zaq
 n1Q8sp1wDOWIe2BUL7nE5Piic5+SHsSi5i23cuUmHyaPkECp0OQN6XqM2/EENCv0WGN9
 JtXjQ1cXeBIWamKBmXBA4j6ksLNcLh6evvOwfltV1cXa7C8FUb6wsx8YErc7BJovOMLF
 qQEDhq0on7j/k/0/ncY1EbrYHhLpGIPntT+HvUgU504B9AXE1ULEtGKnKUxggJaaclpN
 yDHw==
X-Gm-Message-State: AOJu0YyDBibz9duq1vY1tVM2uGd7fT6U8GvS9cF3iaqHkz5fgwTXCPgy
 NOmEH/yz8PpXXNHCh3DLY75eFG+CG8SrZJCqnjGjQA==
X-Google-Smtp-Source: AGHT+IGJy8KYnZyMHC+4fzSHET6hgmed+3GNH6+zA4QShlWQzZGtRyh4P66B+nvfNY4nmXMHOASd9w==
X-Received: by 2002:a05:6a20:3c8d:b0:18b:2020:8cd1 with SMTP id
 b13-20020a056a203c8d00b0018b20208cd1mr42952817pzj.3.1703042291622; 
 Tue, 19 Dec 2023 19:18:11 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.194]) by smtp.gmail.com with ESMTPSA id
 d6-20020aa78e46000000b006d088356541sm16958284pfr.104.2023.12.19.19.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 19:18:11 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20231217165359.604246-1-hch@lst.de>
References: <20231217165359.604246-1-hch@lst.de>
Message-Id: <170304229020.683808.16849978519505449769.b4-ty@kernel.dk>
Date: Tue, 19 Dec 2023 20:18:10 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-7edf1
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, 17 Dec 2023 17:53:54 +0100, Christoph Hellwig wrote:
 > hen zones were first added the SCSI and ATA specs, two different > models
 were supported (in addition to the drive managed one that > is [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.50 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.50 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rFoAy-0000L0-Dr
Subject: Re: [f2fs-dev] remove support for the host aware zoned model
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
Cc: dm-devel@lists.linux.dev, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 virtualization@lists.linux.dev, Damien Le Moal <dlemoal@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On Sun, 17 Dec 2023 17:53:54 +0100, Christoph Hellwig wrote:
> hen zones were first added the SCSI and ATA specs, two different
> models were supported (in addition to the drive managed one that
> is invisible to the host):
> 
>  - host managed where non-conventional zones there is strict requirement
>    to write at the write pointer, or else an error is returned
>  - host aware where a write point is maintained if writes always happen
>    at it, otherwise it is left in an under-defined state and the
>    sequential write preferred zones behave like conventional zones
>    (probably very badly performing ones, though)
> 
> [...]

Applied, thanks!

[1/5] virtio_blk: cleanup zoned device probing
      commit: 77360cadaae562f437b3e98dc3af748d8d75bdc2
[2/5] virtio_blk: remove the broken zone revalidation support
      commit: a971ed8002110f211899279cd7295756d263b771
[3/5] block: remove support for the host aware zone model
      commit: 7437bb73f087e5f216f9c6603f5149d354e315af
[4/5] block: simplify disk_set_zoned
      commit: d73e93b4dfab10c80688b061c30048df05585c7e
[5/5] sd: only call disk_clear_zoned when needed
      commit: 5cc99b89785c55430a5674b32ad0d9e57a8ec251

Best regards,
-- 
Jens Axboe





_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
