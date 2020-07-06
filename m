Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D442152E3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jul 2020 09:11:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jsLHV-0005dr-Fr; Mon, 06 Jul 2020 07:11:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pahome.chen@mirlab.org>) id 1jsLHR-0005dd-Vy
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jul 2020 07:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=exMaJ3toADodjEmD27/3XhJbP+l1x4N3UJdEj2auNCE=; b=mBgSi7wldWEJ7zZwDRbHO/e0v2
 T59Jhqs2JafDg1rn0LTYuE/GABa07jQcgmn/oRGfKu+PJp4tDt7kdDuBPqp7B2bjRZmlDVUC/hCSh
 dNUrusS49uHbIQaRq8l/WCsAl25lqxOtlTAM7S3a4JWU+5QW6czGbJMqMO6TZeveTaqs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=exMaJ3toADodjEmD27/3XhJbP+l1x4N3UJdEj2auNCE=; b=A
 6mrLPk043aMAzT+Uk50VlZl+NWa29Y4ABmjIKaInx0OxNaeBSeZV6d5WamWJB2ocl2pKHETs/FELi
 0lN5Tw0F0Ddv1O2s9h36fwqwaqoCjLB0dBtaCqWhnpxkyqb43AbRlJ9EhLfoHRoVS7tCiU62KmL+N
 VFRzmKeTn875i4jA=;
Received: from mail-ej1-f48.google.com ([209.85.218.48])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jsLHP-00EjSr-AC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jul 2020 07:11:09 +0000
Received: by mail-ej1-f48.google.com with SMTP id l12so41268064ejn.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 06 Jul 2020 00:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mirlab-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=exMaJ3toADodjEmD27/3XhJbP+l1x4N3UJdEj2auNCE=;
 b=J+sl3y8YefqmfQNsUeMaDEvVIf9BGxJTlWbitHv3a4V2HQHU9UmlGzd7KhCJEJBdu6
 IMUQeRjcbR8Fxvs/VamA4v3Lx/vAQVnLCv9bBCyGER6kLAhMN7mV2gvxz4/VKuQLNAZ3
 O2V8noIIjs99O5fW1/x55JuV0XO4l37Z5Dqyg0laWQR4wWvqfL0F/7NrQkcD+DkIrMfb
 msPERuvcCbmJQsMKxvt+XBigS8zNSIPhpL06BTixz7yxMPB0We16nbWJJKHaIlxGc1FA
 Wv8Sz5dQBRa30WIVl2vNrz0tuZiKFgmRg3Q6svhk9meeZ/OP69C9Y5XzrLnH30NvLZDa
 doPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=exMaJ3toADodjEmD27/3XhJbP+l1x4N3UJdEj2auNCE=;
 b=ku6jP3lT/Xe1pj+I0vpXLuGj364OQ1Zcqf09PcwKyncOE6kEgdJuNmaAEExzQewta5
 K8SctdyFbgMp1/IxKnUz4k5ofMCl63Cwwdu4C5owDIAFn05niuq587K1h7k+cF6XHt51
 f1YVR1uxIUphlRhlBu21CRuiJDTO9AfIjO5GoZAxkg/y7hmXgzcIi2d0qWqeZPGcczHr
 eojVfuRdZAlU3X8DB5HI6Q6xkUkMvGYCWXHo3B/gZwK5Y5aVDlxGqfU1/x7a4qPzCGCj
 btNa7lbDYXlmrfOfzEwZr/Wv1JtqveA5zb/syBhDMhy59Y/N+Ic2QEy1xRV7grEB65CI
 g5+g==
X-Gm-Message-State: AOAM532D9KGvFFT/bjOeheMTnWaMPxpfRQwHXpmFoZubh1aqLgUfsxAw
 Rw7t7sBKtcitEj5S30ODy4MRJZKPBK8ILPn9xCMrPlQD
X-Google-Smtp-Source: ABdhPJyglXxa4LmmnXzbpc50tSQf+DROh8ZkcYDC+hCjwM0o0ySkdCgJiLYWc/9JS0dKMZAh9n4sw8zoXcHgegMCE+k=
X-Received: by 2002:a17:906:160f:: with SMTP id
 m15mr35441401ejd.423.1594019460526; 
 Mon, 06 Jul 2020 00:11:00 -0700 (PDT)
MIME-Version: 1.0
From: lampahome <pahome.chen@mirlab.org>
Date: Mon, 6 Jul 2020 15:10:52 +0800
Message-ID: <CAB3eZfvyo4OzN_odXsnvDO6E=YHTt4qe5CXqQUyG7Mrk+MhzaQ@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.48 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.218.48 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jsLHP-00EjSr-AC
Subject: [f2fs-dev] Can I know if now is gc-ing or checkpointing?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I tried to test  performance with f2fs and create many fio to test it.

I found when fio reach a number(e.g. 25 fio), the performance degrade
not in proportional with small number

EX:
5 fio: bandwidth 300MB/s
10 fio: bandwidth 150MB/s
25 fio: bandwidth 30MB/s

I wonder many trigger the gc or checkpoint, may I know if it running
foreground or background?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
