Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8311192AA1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2020 14:59:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jH6Yn-00069M-Ed; Wed, 25 Mar 2020 13:59:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <graysky@archlinux.us>) id 1jH6Ym-00069E-3C
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 13:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0oK1T35kRzLIVp+aOA27DSrz8wTiBfuibPxGgG9Isdw=; b=cw9pk9AILiTHHsQOfOF0+lDZb
 +cmmEvFp6iGTC8Zzwhy9zDlY4hGhzgPc9dWnTuXlzC/QRqMm9/DKtDgHpIN5nAYlnpvGbkMmtHdmW
 36aXucZurW8canQ+yw6BH8+iUqjETN69tf0nxr2ZY7uDDix+kd3tADQYJmKDChDQ1WjEs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0oK1T35kRzLIVp+aOA27DSrz8wTiBfuibPxGgG9Isdw=; b=VFV15iif3ICZyOe7FlLyqlsraK
 gpuvR121sq0weo233K+2OWQScp14z9NFLT8Ru3h4d8ECeK9xnZtQ57/usx4lmsmfNNADK9nr+aJJC
 Yp5hI8fafdtnnM0V4LwV4kN7xnCfpRX2NXPDm0z+L/72gkRiqhYKO8TSjO027izs6Cqo=;
Received: from mail-wr1-f48.google.com ([209.85.221.48])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jH6Yj-00GSbF-JD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 13:59:08 +0000
Received: by mail-wr1-f48.google.com with SMTP id w10so3235595wrm.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Mar 2020 06:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=0oK1T35kRzLIVp+aOA27DSrz8wTiBfuibPxGgG9Isdw=;
 b=FAmf45zyTtDlaIc965PigI8gzAmCejF7Jzrn0Nnnoww8k5ojxFy5CG0fEWkijrYE9/
 QlPWk00lfVdREux7x6cq09w8cXyIxh84aBD7E7OOBqcEK7yeTlA0rp+phs4oZw9KbCmy
 p9c7FUmVIXEvozLFBDqzw9aMPHiJ1rbOfBZ6aMwsf5bja0DJccChbwluYI7U9pdyI+JT
 Ogn+yrZ2ZAY63QDrtJR16j5mRwvmTaQkb7IZb8E9kI4y/OB/pQDoLFfoNb+AGnSFxTUR
 rq0hOEHObN2La6hFwE2Xgl2DC9DPWwHU2EKFpIhz7PhFSR9pv9JG+CU9t7oepIH3R8K0
 F+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=0oK1T35kRzLIVp+aOA27DSrz8wTiBfuibPxGgG9Isdw=;
 b=SELPPqAmFzubiWLCs3Y9i79af2pHRdKdofjWm/uz8u23auyPc/hROyOZFa+Es+C6F/
 VkyPpnrSdaGTeVZu7tqIjkSgRl2Bxl2DCIOl+rTYLTc/HVbDe5ben8qkZkZzmb64fkJc
 g2Hf0/ZlnN2Z30YHXCYYtMIN+V2H/KysvRQE/nhiSeWzzt0EWzhko2BheJji3samMpj4
 gHLmYO8nGs9Qmg5b2vrZE6vfNeAHJ6dgr++7AOvN6jE5pz3pscqWcf9+76VZLhllSwxA
 K2HZmbjL48X672c2o0wgawFujWihVU+Sa/ZX8hDuKbTMsQnOf5X7HjcFyaYJXEvBrWrs
 02Xg==
X-Gm-Message-State: ANhLgQ0C4ncZADDaXz42sAI5k21T6Z0X+pJjP4QKXFJ0hVz+zzC3yeGl
 j20Xs3J5MiMngl/IEsacLhhQeD5NC9ZnqfZytOi82A==
X-Google-Smtp-Source: ADFU+vux4L37uaDeA8G0jO/4lZAGq8OQ/U3FXvC4XVDeGn0lts0PXbKskp6PnCMFtsKjqejbv4KqGmIjOHsOWUO7HNI=
X-Received: by 2002:a5d:5687:: with SMTP id f7mr3412930wrv.425.1585144738892; 
 Wed, 25 Mar 2020 06:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAO_nJAYw+-+n584gg2-rRp3KoAsPT5mpD5yRCrwM7hiDMD=PJg@mail.gmail.com>
 <78bdaf48-9699-3a04-efec-95e1a670bfe4@huawei.com>
 <CAO_nJAZ_bW1Bor-sUb8Ouz4VQV28KPZR23njH4VV+eH=BgwR=Q@mail.gmail.com>
 <418f4ee8-14ed-bdfa-d16c-f68c2992f234@huawei.com>
 <CAO_nJAYTbPqWKAnG1+i2J1jnEKN6QtiMV_CxVyranZ-AWK9Agg@mail.gmail.com>
 <20200323041143.GC147648@google.com>
 <CAO_nJAYEGp1129PsFwMdU0ZdjC75DoL60nXhY7KaATgSPz-2DA@mail.gmail.com>
 <20200323150205.GA119787@google.com>
 <CAO_nJAbyEcTR4wFytJp1HQmQBDzpwycKhA_-FUwo39WVMceuZw@mail.gmail.com>
 <8b47e963-9e12-c945-e40e-a9d54a412d52@huawei.com>
 <CAO_nJAYWQWrWaQVfUmVpJGFtOeKKE76im-AkLUDTJm8DN4VAgA@mail.gmail.com>
 <2292eb8d-8357-227f-5448-d1d03b33c042@huawei.com>
In-Reply-To: <2292eb8d-8357-227f-5448-d1d03b33c042@huawei.com>
From: John <graysky@archlinux.us>
Date: Wed, 25 Mar 2020 09:58:47 -0400
Message-ID: <CAO_nJAaNxRfC6SHQrr0BCDnA2H6HHkz1Pk5vJMCVfGqUSP0u1Q@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.48 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jH6Yj-00GSbF-JD
Subject: Re: [f2fs-dev] fstrim does not recognize FSVER=1.13 of F2FS
 partitions
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

On Tue, Mar 24, 2020 at 9:01 PM Chao Yu <yuchao0@huawei.com> wrote:
> I guess ssd should support discard, however I saw sdb was wrapped with device
> mapper, which may have different character, just want to check that whether
> device mapper disable the discard.
>
> If backup/restore is hard for you, how about let me add some logs on fstrim
> interface? then we could retry fstrim to see where we actually fail.

I have an older totally different SSD for testing that seems to support discard:
# hdparm -I /dev/sdc | grep TRIM
   * Data Set Management TRIM supported (limit 8 blocks)
   * Deterministic read ZEROs after TRIM

As I test, I created two f2fs partitions on this different SSD:
1) /dev/sdc2 normal F2FS
2) /dev/sdc3 encrypted with LUKS (dm-crypt) then formatted to F2FS

Results:
1) Regular F2FS
# fstrim -v /regular
/regular: 0 B (0 bytes) trimmed

2) Encrypted F2FS
# fstrim -v /encrypted
fstrim: /encrypted: the discard operation is not supported

Can we conclude that the device mapper is some how spoofing fstrim
into thinking the device doesn't support trim?  Happy to hear your
thoughts.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
