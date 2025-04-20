Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A93A9524E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Apr 2025 16:01:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u6rhi-0003WZ-Bp;
	Mon, 21 Apr 2025 14:00:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1u6rhg-0003WM-QU
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Apr 2025 14:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=content-type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cfMHn5F+EwpnUPxXPntT3pWz5D4jx+KcZshKph6ZmXQ=; b=Uwp+92Z8KPf2WIj8Xx0ga/4z4p
 FKqFayKwMvM5RkWUQxS0y9JA54HbwuNPJl/DbIOJBh/WGGb0cssAijhamTbuHQRP3ua0/KgapZbcI
 Bms2Kt2x99noUloFQ3VDSUCXuQQ7NffIbqyh/yQAx6CFcKnoEVvnS8y7vsuHfpEfOvVk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=content-type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cfMHn5F+EwpnUPxXPntT3pWz5D4jx+KcZshKph6ZmXQ=; b=G
 0R9aMCWu+LozbfQGmNX3/1lauHjU/nu8lN0F/JdtjBDqCobpleTZf4A+FTWmN0Rx0U4j4H2bKWJIm
 mxlzRf2v53j28w/L7KSbjp0sJKPOijk3HZpjMYywJlSsMtGrlx4AlH9+noBphs6zQZtVwG6RIiFXU
 9t/iHFKitbtHtlfI=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1u6rhR-0003xt-Qa for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Apr 2025 14:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745244020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cfMHn5F+EwpnUPxXPntT3pWz5D4jx+KcZshKph6ZmXQ=;
 b=DGWYjkYMI6iWZt/mvLYymwkSQk+ScjpkLQD89HOVREfVxxGam0N2+RP6byduMZj9AAd7bU
 e5Kskw72Er6PJJD0KPB3tWzuTHZ6Ogq7j8Cf8XMCvcPXHxZjo24SfEHMf49DSMiUBYVkQM
 x0FkL/IVeihfmUevt4M5VMS0qZ2ocHo=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-qkeRn0YyNGqZSwLBvPAMsA-1; Mon, 21 Apr 2025 10:00:18 -0400
X-MC-Unique: qkeRn0YyNGqZSwLBvPAMsA-1
X-Mimecast-MFC-AGG-ID: qkeRn0YyNGqZSwLBvPAMsA_1745244017
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3d81bc8ec0cso72254155ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Apr 2025 07:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745244017; x=1745848817;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cfMHn5F+EwpnUPxXPntT3pWz5D4jx+KcZshKph6ZmXQ=;
 b=SWZn3BoXURZtU+obUGEyuIP9PEX47eSyOn9pYIQYWQSKNnuxbv3jb6Gez2Vyq+xX5T
 S06pbatbjDY/LZi5xXn9OWpLBxxbBrEuArCiWqzVc2ayqiu2xdBYDIIsDzWAVfG7gVsk
 JLC8AvrOuXu7mmGah5CZb8zYxaTpUGp0T8EqETAVaHUcmz7WNfIynXQfuBPW45LknQ5l
 9C7s6loGtLZUayWdfIlN+E3kxFQRTRjphHMtyGcDT5XZFkMCgxL0ir+qiygz02z3DPe2
 6sWrSkK+0x8hgxTNrTBsGHnEtMUPvhGFiCRrIGgWQNysyfU0qHdMOoL08WhoCrUQOEMC
 48Gg==
X-Gm-Message-State: AOJu0YxW6oacNOlfrhp0iGumb8b6m9BjbDglYkDhDrdD6XUFiXoV1jMr
 8Aaq6VNvnUJOnAJ1V4fDrqD48sZaWvTOJl532H4am9Hfsyo5mYRdhm79ShlXMfWi7ICmA47f4sr
 Q985eB3MOHdAosDCXaNNC/MajDM8rWxLc25unUNvwUQ9PW4VmKzo/M5o7QHy2tb/EOyHkHbudAd
 KrMRUVTbt0GSLBeNrC1pJXOB1cRSVcrnmQJwgB4yJgJzVIMaMyYyQo4PuO4Q==
X-Gm-Gg: ASbGncvUuiLi9e6FvO/0waRsvoYuGvECMcWFgDAT5oJcYWAsODweFNAYfGav9o4r1RN
 eVXE2NmXoxzLX46DDf1te73dkiTkyOwZFpU+gaYmUI0JqmYiXgETr9LWEwm7Uz5O/BF+kT1fDVU
 qQj86QBkIzEiUkHxlN1w3J5YFn3MN+EQywFMRKhxhF394X0KYeZeAt/dhgWes43KA7nqmPnzw4a
 CL3rgZNrKhCahhZuhmlm3WvbhQ2fD/7MZByCVmAeAXCasX54vxpPP2IcNxOmhJi8lSnZS0KJTOw
 8ldkZMbDovCzt5M=
X-Received: by 2002:a05:6e02:2163:b0:3ce:8ed9:ca94 with SMTP id
 e9e14a558f8ab-3d894188f96mr82716845ab.14.1745244017229; 
 Mon, 21 Apr 2025 07:00:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp9tbKCdsJJ7qWC5NHVoXlI1cQ9dfkW+Ww++eOP4zIgSfdC7asgof3x4G4bkAo1KHVmv4Hyg==
X-Received: by 2002:a05:6e02:2163:b0:3ce:8ed9:ca94 with SMTP id
 e9e14a558f8ab-3d894188f96mr82716365ab.14.1745244016614; 
 Mon, 21 Apr 2025 07:00:16 -0700 (PDT)
Received: from fedora.. ([65.128.104.55]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f6a3839336sm1788866173.73.2025.04.21.07.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 07:00:16 -0700 (PDT)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 20 Apr 2025 10:24:59 -0500
Message-ID: <20250420154647.1233033-1-sandeen@redhat.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -qq8hf9th4WKNZCnV-kIs1XhN5wAR0Z7JwBK9ZIjIkc_1745244017
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This is a forward-port of Hongbo's original f2fs mount API
 conversion, posted last August at
 https://lore.kernel.org/linux-f2fs-devel/20240814023912.3959299-1-lihongbo22@huawei.com/
 I had been trying to approach this with a little less complexity, but in
 the end I realized that Hongbo's approach (which follows the ext4 approach)
 was a good one, and I was not making any progrss my [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.8 DATE_IN_PAST_12_24     Date: is 12 to 24 hours before Received: date
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u6rhR-0003xt-Qa
Subject: [f2fs-dev] [PATCH 0/7 V2] f2fs: new mount API conversion
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
From: Eric Sandeen via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Sandeen <sandeen@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is a forward-port of Hongbo's original f2fs mount API conversion,
posted last August at 
https://lore.kernel.org/linux-f2fs-devel/20240814023912.3959299-1-lihongbo22@huawei.com/

I had been trying to approach this with a little less complexity,
but in the end I realized that Hongbo's approach (which follows
the ext4 approach) was a good one, and I was not making any progrss
myself. ;)

In addition to the forward-port, I have also fixed a couple bugs I found
during testing, and some improvements / style choices as well. Hongbo and
I have discussed most of this off-list already, so I'm presenting the
net result here.

This does pass my typical testing which does a large number of random
mounts/remounts with valid and invalid option sets, on f2fs filesystem
images with various features in the on-disk superblock. (I was not able
to test all of this completely, as some options or features require
hardware I dn't have.)

Thanks,
-Eric

(A recap of Hongbo's original cover letter is below, edited slightly for
this series:)

Since many filesystems have done the new mount API conversion,
we introduce the new mount API conversion in f2fs.

The series can be applied on top of the current mainline tree
and the work is based on the patches from Lukas Czerner (has
done this in ext4[1]). His patch give me a lot of ideas.

Here is a high level description of the patchset:

1. Prepare the f2fs mount parameters required by the new mount
API and use it for parsing, while still using the old API to
get mount options string. Split the parameter parsing and
validation of the parse_options helper into two separate
helpers.

  f2fs: Add fs parameter specifications for mount options
  f2fs: move the option parser into handle_mount_opt

2. Remove the use of sb/sbi structure of f2fs from all the
parsing code, because with the new mount API the parsing is
going to be done before we even get the super block. In this
part, we introduce f2fs_fs_context to hold the temporary
options when parsing. For the simple options check, it has
to be done during parsing by using f2fs_fs_context structure.
For the check which needs sb/sbi, we do this during super
block filling.

  f2fs: Allow sbi to be NULL in f2fs_printk
  f2fs: Add f2fs_fs_context to record the mount options
  f2fs: separate the options parsing and options checking

3. Switch the f2fs to use the new mount API for mount and
remount.

  f2fs: introduce fs_context_operation structure
  f2fs: switch to the new mount api

[1] https://lore.kernel.org/all/20211021114508.21407-1-lczerner@redhat.com/




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
