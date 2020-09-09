Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB5126266E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Sep 2020 06:44:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kFrxh-0007vA-4Y; Wed, 09 Sep 2020 04:44:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kFrxg-0007uy-30
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Sep 2020 04:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Frc88nWVxqOgZCPp9FgZZwYWNAXmlsLlRS79TyYt+k=; b=G3f/Zqy5nYoo4+VXGTXG7KGZhM
 VqpYVoMwNsFw5fKyWUOFdmJJgjB0ped0HIpJUZdHNY6ssBcLr0IObllv5voJdFWEm3FFjQi2OGO7x
 Zc5JZ2dw7NBeQNBky1B28fKzbG81fMVLiwMqBGr8ws8f9MWZ/lia+nWOMJOONss0AvaI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+Frc88nWVxqOgZCPp9FgZZwYWNAXmlsLlRS79TyYt+k=; b=Q
 vCf53be5shAC3uToSA2kvGn0aMdIrdkRGwP4R0LUKdIbFcesJGNykNGGQNaxTa3ieNbNsYzo2Kgju
 fg3KVM92sk7JIYiGQIdoygTr3kbyw5XbPM4Vdh/CsWvrlfMvhnIMZUHDp1KKJPTp4If4duoceaQtp
 ylABUnGfm0ZlVhq8=;
Received: from mail-lf1-f54.google.com ([209.85.167.54])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kFrxZ-0008U3-6Q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Sep 2020 04:44:00 +0000
Received: by mail-lf1-f54.google.com with SMTP id y11so862520lfl.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 08 Sep 2020 21:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=+Frc88nWVxqOgZCPp9FgZZwYWNAXmlsLlRS79TyYt+k=;
 b=Dwg59ndAo9mc/agQv3gjaaTTTXm3bY9/MK2VVav9f0jLsrFgS/IgWdT3iXx9vNbh/Y
 +pD/8Ke6jvFKF5u96ZWQ2R+DPbXrG6/LCJ8pe/jvzVdDJhu8JFJvR/ka67UZ29NH76WS
 bWKLCGHBIw4/FM6iWwPx18/5ggjzH0i97eBmnIynlOwW6PejaXL+kcg9D6Nwx+BOcgFM
 pK4kFThqV7gh7UDqd+swg/j5b15CVGpXICFdV9RsyHPS8Q65JiUsRs/LdkU17Qy+z2MU
 lNwSP/MvzQ1AgovvvneyL66HhyeHVXIApzwakXQH4c2Gfk0P1M8UUmZ9UtP0YvOCdJGO
 uU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+Frc88nWVxqOgZCPp9FgZZwYWNAXmlsLlRS79TyYt+k=;
 b=qdpDhTxZhgMMPb5u5ZV1CEVK3YimUTxjiYP9ZBQXNt93rAgEr1FQayUOiRM/zQb7zY
 FaTUJD9+UHC8XtBckMRDiU9VPeLc8dNcTkU4AA+1m3dl/i7R4gx7j5FCAfdSyJ1l6w/u
 lYWftiVMlbkXcSq/DCAb+domi8f6DAUJtaaWOlHsMqJrUI+v1WDLwHScp0FofGVDL+50
 H5jui8k8JBcWcbrBMO/wBIUCdFMiHWELrBd5iTA+ChAhxhBOMGFmJOW30M4o+HMl+kR2
 RPJ6GnI1yLNWI+SOsvgq/zwgYA48StdDOms62fjskGL1vgBBmQ+7yljPwRpFXS4y5zi6
 TXdA==
X-Gm-Message-State: AOAM5325Y9HBtUUEZkppHqD8kWNubLo6VwOupRF8FHmb/xiSj53EB89E
 D646qaLlDQ8XkomjAESMOtkZLjo7N3LL4AH9yBs=
X-Google-Smtp-Source: ABdhPJy/WnFcessueE4ZbBB4HUH7HGp4dNhQNDK9ta48C2nZASwNJyyVij9IU8oMNnpEvGF0SEfdKgS8aCDcOcNLt0A=
X-Received: by 2002:ac2:5a5d:: with SMTP id r29mr1024362lfn.131.1599626626396; 
 Tue, 08 Sep 2020 21:43:46 -0700 (PDT)
MIME-Version: 1.0
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 9 Sep 2020 13:43:35 +0900
Message-ID: <CACOAw_wHONVJL438_Akvo3wZewJeVKiT_8LqW0EXULxAscpGjA@mail.gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 kernel-team@android.com
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.54 listed in wl.mailspike.net]
X-Headers-End: 1kFrxZ-0008U3-6Q
Subject: [f2fs-dev] Question about STEP_DECOMPRESS_NOWQ
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

Hi Chao,

I have a question about the below flag for decompression.

STEP_DECOMPRESS_NOWQ,           /* handle normal cluster data inplace */

According to the comment, you added this for using inplace
decompression but inplace decompression mode is not being activated
now, since we are setting STEP_DECOMPRESS right after bio_add_page().

                if (bio_add_page(bio, page, blocksize, 0) < blocksize)
                        goto submit_and_realloc;

                /* tag STEP_DECOMPRESS to handle IO in wq */
                ctx = bio->bi_private;
                if (!(ctx->enabled_steps & (1 << STEP_DECOMPRESS)))
                        ctx->enabled_steps |= 1 << STEP_DECOMPRESS;

Did you mean to deactivate inplace decompression mode on purpose,
since it had an issue? I am a little bit confused about this.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
