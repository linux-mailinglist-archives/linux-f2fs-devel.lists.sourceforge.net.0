Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 286641930D2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2020 20:04:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jHBKU-0001s0-Q1; Wed, 25 Mar 2020 19:04:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <graysky@archlinux.us>) id 1jHBKS-0001rR-S2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 19:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7ItNk8QaTyrLY6ja5kr96/9LqdJ+3U3uUl1cJMIyulA=; b=j0JrWQia5SSJg9ctdnhdEd+qd
 AeypD/uN9QBwjnKJif0lm7E1R4GCMjgKpq8aZp1OOPKkyp+8gYpONqxhGnaKrEG3GdmpUzBAIIIL1
 k364Ko1lwIbB51ldCORq5RCQIl9NpUo7c2HPuf3NHWdKKncjzpZTMwVUWfj4v45sZEpr0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7ItNk8QaTyrLY6ja5kr96/9LqdJ+3U3uUl1cJMIyulA=; b=fNLJrYaB7HN7FbTi7t/STUGWsA
 XAJlZHTmCJvUeejlhbCNBzjAf+OTjTEyHlIBtpmEV+axkDfDq9M54yDNINxPV8LOpnNQmgVkiXQMZ
 uDGuTrNURMFSss0KFFLJkkbjmOGazH2DY4hqAR8wF//tr+Xzbufwd/Lp6yXSoEGh+zJg=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jHBKQ-00H4CL-Md
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 19:04:40 +0000
Received: by mail-wm1-f65.google.com with SMTP id z18so3777062wmk.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Mar 2020 12:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=7ItNk8QaTyrLY6ja5kr96/9LqdJ+3U3uUl1cJMIyulA=;
 b=ATQGFsknufvUo30/dooH5vxdeIoPgE4vGUip9uVkQAOgz/V5xZrUESdfF+EDW0XWlI
 VNsZJpCZFmXM9NsuvMQldQkD6CdUOoWRKt1nFziWEqjUZtUrenbMDfEwlCmzXlI0Fiys
 AzsC07QBpqL7fo/3KG1qzp7kttL5T7pRtnHcYObWDR68npKZfap9WcmZM7pJRQIX3hMP
 FAPJvrvWpdHWnmPHLsJOFbAMHi5kTUw12yEATqZmQLhQkIu2sOHTHhNPv9xE2yIV5uPv
 xssvnP2F5oQbHvnq7YGoHlmEjBIoFTy9JvOPoR12BRpued5Z9BQSwtHy8agHbl/lWcD8
 ZYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=7ItNk8QaTyrLY6ja5kr96/9LqdJ+3U3uUl1cJMIyulA=;
 b=NSMrNePhHwzPr6jDTniVNWhdQM2EN5sz0prf/Knqyqc7wnj9M+RMQ1INDEEHP+bPIt
 pke9bGChUgxKKpxn2FqZAs7CJI2MKwuKtZG5YUn1FS/QGaGv8nIpeED1d4t7QLlfLkOD
 XN4bmVlq9nIkiMHMuKzPomqim2ybvMDV2hbp25pAj+9DTJu2hFIB0K9VHaPiDiwEY1xo
 YBWGKz71/sdix4nBUFbWjfPO6J7Rcd4lvr2diGXk4feRrYdVbKArYsjlsgHqqzgZmDvL
 jq1KrtAGsxHXFASWgAuy3k+Q47sAgd70ZL1o21HkTEwXdE3WAAPl5OU63u2tcT46iZM3
 oTKQ==
X-Gm-Message-State: ANhLgQ0Rv/KNcls6t+ya4C4lkGR2mmvhho4BOAEsh5ESdP7XEuqdACTG
 bl0/Phj1mY4bfdPXRuuMVxcfeUqfTXLGVRzUZZikSw==
X-Google-Smtp-Source: ADFU+vuVAK7Yu/4vLC1YiZi5c5bFuKkMO9YfclV3d1bsl6QEkvIW0JOrEM0L4Wu3KwT+MledM3sRQAi6FeAljWmaj5I=
X-Received: by 2002:a1c:c3c3:: with SMTP id t186mr5060118wmf.118.1585163072158; 
 Wed, 25 Mar 2020 12:04:32 -0700 (PDT)
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
 <CAO_nJAZH7smWvgTmtCvaapwKWut_OYeJzeTxmA1XrB_pGW+e8g@mail.gmail.com>
In-Reply-To: <CAO_nJAZH7smWvgTmtCvaapwKWut_OYeJzeTxmA1XrB_pGW+e8g@mail.gmail.com>
From: John <graysky@archlinux.us>
Date: Wed, 25 Mar 2020 15:04:21 -0400
Message-ID: <CAO_nJAbKHvD5YJ=PLv=Dbfi2xD6N7XX6LV7TAraKSaZ1MOx81A@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.65 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: archlinux.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.65 listed in list.dnswl.org]
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jHBKQ-00H4CL-Md
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

On Wed, Mar 25, 2020 at 2:41 PM John wrote:
> I can confirm that it is true with an encrypted ext4 partition.  I get
> the same error, "fstrim: /mnt/test: the discard operation is not
> supported" when I try it there on the same device.  Unless there is a
> good reason for it, not having discard on LUKS encrypted partitions
> seems like a pretty serious omission.  Perhaps it is intentional.

I see now from searching that this is by design,
https://wiki.archlinux.org/index.php/Dm-crypt/Specialties#Discard/TRIM_support_for_solid_state_drives_(SSD)

I added the "discard" option to the entry in /etc/crypttab and
rebooted. I am now able to get a successful run of fstrim on this F2FS
partition:

# fstrim -v /mnt/media
/mnt/media: 0 B (0 bytes) trimmed

Is it normal to return 0 bytes trimmed for F2FS partitions?  By
contrast, if I go to my test SSD, create a LUKS partition, open it
with the --allow-discards option to cryptsetup, format it to ext4,
mount that and then run fstrim on it, I am getting non-0 values for
fstrim when I run it:

# fstrim -v /mnt/test_crypt_ext4
/mnt/test_crypt_ext4: 3.9 GiB (4123463680 bytes) trimmed

So I think something still isn't quite right with F2FS over crypto_LUKS.

Thanks for the help!


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
