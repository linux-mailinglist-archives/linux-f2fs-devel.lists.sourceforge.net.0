Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E212F37B54
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jun 2019 19:44:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hYwRb-0005FE-Sh; Thu, 06 Jun 2019 17:44:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <torvalds@linuxfoundation.org>) id 1hYwRa-0005F7-Kl
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Jun 2019 17:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fSh9JeAYZqEFU07GFlcm4g2RwNfVCw5VkJKLPgvFgpM=; b=kf+c/gqnpENZwqjc6clCGEX2c5
 Fb1chEQ3aBQiIDPsPAtkWGU73L42ZTx4l8uholSgnDj96L92xQZrCzqRbgqpGdhstZFkV7z+iFfcr
 pyWGGuX4CTm7bTFmz0o7pwzvruIUJBucPyFj2Hue4hoVwtE6+k9wMUvRa/4JnmCvy2BM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fSh9JeAYZqEFU07GFlcm4g2RwNfVCw5VkJKLPgvFgpM=; b=bpsZrOiUuMER1JDloWAPU46dPS
 cyqLfpcgQpLsUn3CNTQBTAKmBELncJ7sGybrAE4fBMBj87V6I14czjRJ2XtBFmWwqsad+/4v9UCaP
 h9n7wwQdkV9VyiQW023EAgUsS93Vx/N6O+bO4dXMfCM6w9VpR9cAZyPGniYYORuBQU40=;
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hYwRY-00DpUI-Nc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Jun 2019 17:44:54 +0000
Received: by mail-lj1-f195.google.com with SMTP id o13so2867466lji.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 06 Jun 2019 10:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fSh9JeAYZqEFU07GFlcm4g2RwNfVCw5VkJKLPgvFgpM=;
 b=GXSY8IkFrWa7J8B6PJEPqJ0gkrWF9aF2wuVJ0wQ40ziAUSXofomBUgMg2tSIClx+89
 +trdK2/MhDj4EjpP2yv3Xn8pX3rA48qk6bQhrjbIVV9fY3W5uHsxoW6S3hiV1u6bue1h
 +WQ8hOkagCs/4IfWuZtcPZAZi6BK/PN2CpG1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fSh9JeAYZqEFU07GFlcm4g2RwNfVCw5VkJKLPgvFgpM=;
 b=RCXaZQno+9vdPW3/EmztVXAUQq2oWlmS9mlqWY1oyuGY36UJ0cG8yPE+eAqMM7aGiQ
 dWlog4uDgAMVs41NIHdnRjw1JHjKyR6dPhopGP8GBok07RfryA7uv5jQKkU9y8PhyQic
 5XR6Bnd3YYgLcviE95GUcr5cUj8EiUVpGKWgu5zeJS0K86I/UbOTQgVFcc97jcysJJVb
 QNBpCfOz+l3JQl/4g5K4QGZU8VkhHG991Ua6Qb70m/7BHIbNH7Ib+rYpSQDTrVL5i6M6
 RnCTJHjEa0BqzHFSurbRIuih9xfC7sDfy1mS9b641aVlwzPdNduQlA1Y1FvDKz0vFceA
 jkYA==
X-Gm-Message-State: APjAAAWnj4lKlCLlUQ9X8BH9zwkNlKfgP9ViS+I5+CDHRomS2M7zDRlV
 ub6iYzUdzYpS2YkZIrQb8CMSXm0aoLg=
X-Google-Smtp-Source: APXvYqweT71r0Y+/HlX3xsW2wwbK9VnElOsBUHWNBrQo5OdhtSyYREzOfZ5F4FXdLS2YShrn111ADA==
X-Received: by 2002:a2e:8e90:: with SMTP id z16mr6232067ljk.4.1559841689764;
 Thu, 06 Jun 2019 10:21:29 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182])
 by smtp.gmail.com with ESMTPSA id f4sm454412ljm.13.2019.06.06.10.21.28
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 10:21:28 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id v29so2810453ljv.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 06 Jun 2019 10:21:28 -0700 (PDT)
X-Received: by 2002:a2e:9ad1:: with SMTP id p17mr26100221ljj.147.1559841687851; 
 Thu, 06 Jun 2019 10:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190606155205.2872-1-ebiggers@kernel.org>
In-Reply-To: <20190606155205.2872-1-ebiggers@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 6 Jun 2019 10:21:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgSzRzoro8ATO5xb6OFxN1A0fjUCQSAHfGuEPbEu+zWvA@mail.gmail.com>
Message-ID: <CAHk-=wgSzRzoro8ATO5xb6OFxN1A0fjUCQSAHfGuEPbEu+zWvA@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.195 listed in list.dnswl.org]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.6 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hYwRY-00DpUI-Nc
Subject: Re: [f2fs-dev] [PATCH v4 00/16] fs-verity: read-only file-based
 authenticity protection
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Linux API <linux-api@vger.kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-integrity@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 6, 2019 at 8:54 AM Eric Biggers <ebiggers@kernel.org> wrote:
>
> This is a redesigned version of the fs-verity patchset, implementing
> Ted's suggestion to build the Merkle tree in the kernel
> (https://lore.kernel.org/linux-fsdevel/20190207031101.GA7387@mit.edu/).
> This greatly simplifies the UAPI, since the verity metadata no longer
> needs to be transferred to the kernel.

Interfaces look sane to me. My only real concern is whether it would
make sense to make the FS_IOC_ENABLE_VERITY ioctl be something that
could be done incrementally, since the way it is done now it looks
like any random user could create a big file and then do the
FS_IOC_ENABLE_VERITY to make the kernel do a _very_ expensive
operation.

Yes, I see the

+               if (fatal_signal_pending(current))
+                       return -EINTR;
+               cond_resched();

in there, so it's not like it's some entirely unkillable thing, and
maybe we don't care as a result. But maybe the ioctl interface could
be fundamentally restartable?

If that was already considered and people just went "too complex", never mind.

               Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
