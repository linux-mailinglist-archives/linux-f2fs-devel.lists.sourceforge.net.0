Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB3519308E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2020 19:42:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jHAyb-0006Fx-6k; Wed, 25 Mar 2020 18:42:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <graysky@archlinux.us>) id 1jHAyX-0006Ff-8t
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 18:42:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Slsu/AAkMU+tplzARlmwsObFsXBIU7nCam0ng6KMurg=; b=ibAqMYtSfE/1BeJ6Z14xHCP5CK
 Rti/av/tk/2kCRkGcqcZiR5+5JmtYrQvv91JfBX0YqjQ3EPNfObHsMGU0WgRLDWDCSbQO+CVKpOuo
 m9vBYBrR3G9ABaDjtUa95DsOm3al7LPoiLuvJss9KfG7BsZ3WAzULXi50pEwUkaGJhqY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Slsu/AAkMU+tplzARlmwsObFsXBIU7nCam0ng6KMurg=; b=IvTCPHfj2mhKov152Hols6ToEH
 fZY6XOq2PHfoDIe+ZzmvoBzeJv0T2W7ojxodYj7Z3d1V5reFkXWXm2QXBcVCV+vMnlN4fiPLiNujI
 YDuyrImnuROVeeDvn0NdRp+uVb/gUbCBd+hQvkmqcLEjMONThdB4l54mO+YOoBldi1Us=;
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jHAyS-007Cd7-OJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 18:42:01 +0000
Received: by mail-wr1-f53.google.com with SMTP id 31so4545148wrs.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Mar 2020 11:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Slsu/AAkMU+tplzARlmwsObFsXBIU7nCam0ng6KMurg=;
 b=oM06dyIMy7usIcAG7jmpS75MbcOf6sD3V1iuX0hL8XnIePEEAMRoTn2MeUi061OCPo
 8Dj2CyUIMd4Oo/DDYKbL5k23t0/a/M+OHqAOWnErifZsxSfg3K5jT97uIjaNcpjSK5Yo
 akoxez4LPZcAL2sBCSuKoY7GcT3s9/Erm3sOmjj18WDtn0fOm3fJ4+tInLXxyp+Sj6OE
 2Z14lHF0NdjfKkKubTcOK9a3zVj5l0MRaSQHZRe8BMDG83fOCf6JE81ZfEd//Xse66rm
 N4GAAv8KYMOo0GscjXcdpptRg3EomZhOJYr30pr0HL1I46nXALQCENKE9UIG+rSTUl9b
 /2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Slsu/AAkMU+tplzARlmwsObFsXBIU7nCam0ng6KMurg=;
 b=IgmewoBqiGnH3r4hNXK2TTbAc6l9MLQ+e5PwLUIUm+hTG5/bkReZ0kd/siOWXu7Ci8
 X0LhfFxcUZCgaLezMhesz2VE5I5hTRDOpXkfiz4fCeSjx4FIwSiYuZ0GOkspqo4rBYcP
 NbaaG+JtK8NuvkLvTz1yrTtbabvKswYHVy5TejKG78JIB0LLKmqiJWDFAN8dcWsQslS8
 OWH1W/gAAhyvO8bHqJrBNab/CmDPNHdf4UG28gX/4BRHLTZKfDTaMORxVB1wM8q5KsxJ
 f79mpqVIMJmrbxN6OBLoe0zX7hEPkG8wVstXY7AX8lkCV7/Yh1q9x+f7X8vKZD2I6WWf
 evHQ==
X-Gm-Message-State: ANhLgQ0mK95QWCQY7U6g5h3yohAwUn35ZvxDUAcCEr6ljKdmmN82jW7Y
 zyb1l7C+wjHbeUSjBm9I51XjNattW6lkGJyK3R9/Pg==
X-Google-Smtp-Source: ADFU+vvzGoz5azphWPy7b2gJWKWTXjqbtfU5tzCASkfB243OFeFV3Gg6BnrcVkEoDQSBm7IYvxejzNyU8VJ47fXD5qA=
X-Received: by 2002:a05:6000:11c2:: with SMTP id
 i2mr5203250wrx.210.1585161709942; 
 Wed, 25 Mar 2020 11:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <418f4ee8-14ed-bdfa-d16c-f68c2992f234@huawei.com>
 <CAO_nJAYTbPqWKAnG1+i2J1jnEKN6QtiMV_CxVyranZ-AWK9Agg@mail.gmail.com>
 <20200323041143.GC147648@google.com>
 <CAO_nJAYEGp1129PsFwMdU0ZdjC75DoL60nXhY7KaATgSPz-2DA@mail.gmail.com>
 <20200323150205.GA119787@google.com>
 <CAO_nJAbyEcTR4wFytJp1HQmQBDzpwycKhA_-FUwo39WVMceuZw@mail.gmail.com>
 <8b47e963-9e12-c945-e40e-a9d54a412d52@huawei.com>
 <CAO_nJAYWQWrWaQVfUmVpJGFtOeKKE76im-AkLUDTJm8DN4VAgA@mail.gmail.com>
 <2292eb8d-8357-227f-5448-d1d03b33c042@huawei.com>
 <CAO_nJAaNxRfC6SHQrr0BCDnA2H6HHkz1Pk5vJMCVfGqUSP0u1Q@mail.gmail.com>
 <20200325152859.GA65658@google.com>
In-Reply-To: <20200325152859.GA65658@google.com>
From: John <graysky@archlinux.us>
Date: Wed, 25 Mar 2020 14:41:38 -0400
Message-ID: <CAO_nJAZH7smWvgTmtCvaapwKWut_OYeJzeTxmA1XrB_pGW+e8g@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.53 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.53 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jHAyS-007Cd7-OJ
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Mar 25, 2020 at 11:29 AM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> It seems dm-crypt has discard-related support, ie., "allow_discards", in ctrl.
> But, FWIW, the target simply doesn't support discard at all.
>
> # grep discards_supported drivers/md/*
> drivers/md/dm-cache-target.c:   ti->discards_supported = true;
> drivers/md/dm-clone-target.c:   ti->discards_supported = true;
> drivers/md/dm-log-writes.c:     ti->discards_supported = true;
> drivers/md/dm-table.c:  if (!tgt->num_discard_bios && tgt->discards_supported)
> drivers/md/dm-table.c:          DMWARN("%s: %s: ignoring discards_supported because num_discard_bios is zero.",
> drivers/md/dm-table.c:           * 'discards_supported') or it relies on _all_ data devices having
> drivers/md/dm-table.c:          if (!ti->discards_supported &&
> drivers/md/dm-thin.c:            * Setting 'discards_supported' circumvents the normal
> drivers/md/dm-thin.c:           ti->discards_supported = true;
> drivers/md/dm-thin.c:           ti->discards_supported = true;
> drivers/md/dm-zoned-target.c:   ti->discards_supported = true;

I can confirm that it is true with an encrypted ext4 partition.  I get
the same error, "fstrim: /mnt/test: the discard operation is not
supported" when I try it there on the same device.  Unless there is a
good reason for it, not having discard on LUKS encrypted partitions
seems like a pretty serious omission.  Perhaps it is intentional.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
