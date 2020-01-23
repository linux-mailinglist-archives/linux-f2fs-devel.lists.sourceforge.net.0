Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0095D147330
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jan 2020 22:35:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ac9ah9N38Je3reg0ezRvRLfC+z4P7Is/eySUfqI+Ux8=; b=KBYJ8Lr5vF05OaGwtxUnT1Avpx
	n1Th57YO2kFbHLC3uQlqwFzZQioa/kw8UypxhQgMcQDj1SKk/wuIlT6ptpCIRY/NgEL4jXAemVSgs
	mT3BulWUSwEQpFxtyyxqF6tNvVfIBC6Ov6qQfqJGV28lplQiMrgRQaFSq0GKphEmK9RQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iuk8Q-0005X9-0R; Thu, 23 Jan 2020 21:35:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <drosen@google.com>) id 1iuk8O-0005X2-HU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jan 2020 21:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5JEo2S95QV9RzdysiSqX6sLlLVR7bGOobEMqZB4SbLo=; b=Jjc2sr9+2oHWfeGkZXUWaBLbbK
 MAh7sn8F2UR+tG0yr041cP4o1nqdGcLujKM8EndOs8QvtKkOaGXcINb8FULkmcQC+g3DE4Iz0siII
 pP9hfIXIl83h66ot46nJarUSpYhm+CutGvG76YJ8eb8RQQBny+vWcXdYs31dbjOzlPkc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5JEo2S95QV9RzdysiSqX6sLlLVR7bGOobEMqZB4SbLo=; b=XG0rICZQ6LJ7AKTwdbO92ahWvi
 hlEDTKVTVU0O1fObVBDeuWFCKJh1MByOXqb0KpXonJV60PuIizY86/ZwYZMQvxPYAdap6bb0Pe4dJ
 IXMoFBCf/QRZ3f7liDcBJYfoDmEavbmqWErUMKy9V5ebH1VBWSOsOWFZ6HFZQBrP76aY=;
Received: from mail-lf1-f67.google.com ([209.85.167.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iuk8N-002t7X-6v
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jan 2020 21:35:28 +0000
Received: by mail-lf1-f67.google.com with SMTP id f24so3483595lfh.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Jan 2020 13:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5JEo2S95QV9RzdysiSqX6sLlLVR7bGOobEMqZB4SbLo=;
 b=LrAqB744pt/J8vqkIc85K0oHNitxTEwLxcSEUaIu43WhAUvXxzMBCno2LvKfhQXu0L
 QMnDBsNc3YXR2shrIDVs0cUYKafdaONjLDcBPiNDFxzTadHp5C4whl76dAFOre9YwVzU
 SY5P5FuMOtoNfri/t2DbZOWE9hkwyIdKhD+6dX4Frdz9995yNciwne+2Og90Q1HkEPiX
 NuHYw4ugQZx1YCWveavpWPHRqj1dsxgKFKB39MCg2ouG++cHgAe6Ch91a9z0efCDXaHQ
 2k7yiw90gujkm3E+HDqwQmF2Ea0YT5OQ0JDQimumZ7sEChjjoRThspQXQ+9ucSEyluzb
 +R3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5JEo2S95QV9RzdysiSqX6sLlLVR7bGOobEMqZB4SbLo=;
 b=di5JVmJA5imNRBdDjBI61vjQfrQN3wGjNmOJo5HpdZwfeCcK+4t/deVlr3oep+9WAO
 NM9BZ4VDvbtKqeeccEg7jUhlZ5s3W6P/Io5tPhP9WVqxE3TYpDc5hyF6C83xGTBjdvqQ
 bLgR1CwtwpXZWLKXas/k98sMWDHxhzipsE06OQ1POO/OYetjTOMIAsgz4CYmi+8epgkP
 hGoPQKJaIhwiZU4wrW+JOiQrW29PZlhuRJrZrDxDg/4+LXRv+JCRY7XSCw49YLzqQKWo
 cmNjnvV270w0gpUAc7ZOqCuxd1ykfMkNjzkDKVhqJIWlQfV9xYNNrhlZYRfzyi/YGGBK
 MckQ==
X-Gm-Message-State: APjAAAUs17PkO+k307WJ9b8zyOglx3xcN6NOq0uzGUjL6zr0mfshnzD/
 nb++7grUsPt9LpaXogqnJcFmkd/xuM1OYWaMN932MA==
X-Google-Smtp-Source: APXvYqx0p8hvRbgBC26M9FVdzAYzLSri+D8u6aFzpfJCv9MmjQWjujEFU9JKr/o3Xmz+P0huC2zlxY0gHbxp1WC7mHE=
X-Received: by 2002:a19:c307:: with SMTP id t7mr5721872lff.166.1579815320173; 
 Thu, 23 Jan 2020 13:35:20 -0800 (PST)
MIME-Version: 1.0
References: <20200120223201.241390-1-ebiggers@kernel.org>
 <20200122230649.GC182745@gmail.com>
In-Reply-To: <20200122230649.GC182745@gmail.com>
Date: Thu, 23 Jan 2020 13:35:08 -0800
Message-ID: <CA+PiJmRBM-0J+LAckrvzg_bxEF+EmjwG5_PzgiWJ7SQu219p2g@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -15.8 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iuk8N-002t7X-6v
Subject: Re: [f2fs-dev] [PATCH v5 0/6] fscrypt preparations for
 encryption+casefolding
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Gabriel Krisman Bertazi <krisman@collabora.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jan 22, 2020 at 3:06 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> I've applied this series to fscrypt.git#master; however I'd still like Acked-bys
> from the UBIFS maintainers on the two UBIFS patches, as well as more
> Reviewed-bys from anyone interested.  If I don't hear anything from anyone, I
> might drop these to give more time, especially if there isn't an v5.5-rc8.
>
> - Eric

The patches look good to me. Thanks for the fixups.
-Daniel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
