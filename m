Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1980FA9BDC2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Apr 2025 07:12:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u8BLv-00007g-Ks;
	Fri, 25 Apr 2025 05:11:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1u8BLu-00007Z-2a
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Apr 2025 05:11:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UQkXVgJ5NO7obkPDf8uGAsa3u0lKaFDauLCJO8nq0jU=; b=BXUMe2PrY/hBtXUOxXc4tIhkIU
 w+6MzNk/eut2SSmGD7z3w3PN/vrMMXYwtyDrfhet3SzxhprXJW/uNJrB9cYRDHA/nS5EjG2vt1xVH
 csUgf8/AJF91oZykfhnuYxeTFuGwAqfMqD1pRtjDnRWFABopM0esmQfUtbuPiav2UhF8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UQkXVgJ5NO7obkPDf8uGAsa3u0lKaFDauLCJO8nq0jU=; b=c
 mELtX7x3NJILC6e9EyGdczOF02diSa37IB82LeauY/cwhf2Bnb48eEzqTRzim+YZL3s47iE8gVedj
 VOdG9n3+YLWOvV/2te7mF16kL+6zxlOMVyvIRy/eja5X90FscVyAdqZuiszzFUcd1+BvLTUC9MOc5
 twOYvdB7/JW9uqto=;
Received: from mail-wr1-f48.google.com ([209.85.221.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u8BLe-0000wt-Sr for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Apr 2025 05:11:54 +0000
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3912622c9c0so203076f8f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Apr 2025 22:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745557887; x=1746162687; darn=lists.sourceforge.net;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UQkXVgJ5NO7obkPDf8uGAsa3u0lKaFDauLCJO8nq0jU=;
 b=SCN6xB1Pa2kbfxSPulM5wiBd0b0nqYVcxLVye4R7ZaoZU9vI/0Nbr3D3tu1NpgL9vx
 Rjn4M3eFnFeSKA8mwyfsHGXg3D28Y6kFsGUxG9StKpjfigAc65w3rKcjkHZut4kWWnIF
 0UzVvi3NhpZjt3rN5LYy9SOgAbpg3JVBJ3uRv9rVaAQnOU1PAbOQfdCFpq2nmffRI1ry
 dYwKgUB4Hq2qJ9p4IlqdnfdeD6iDKtqMnRwR9HXOfBZf/rwmnMNNQkd423p0dQ/6J2xZ
 ZghXxdtaB7FQ4FLjdeUiBo299vfOFp63AulK/g8biXKLmTxkiaZtF6ckoSsp59kMsacf
 sRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745557887; x=1746162687;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UQkXVgJ5NO7obkPDf8uGAsa3u0lKaFDauLCJO8nq0jU=;
 b=WkFOtpEsiX1m5jfZ7Z5dLSW3o37wV0l8VxhznxC506XH2xQJwN9tgVV6q2eaUK1sA4
 aAjX8ZEpDXDDkeCSLbyyydCx2ns2pQI3w7DC8288aoqDvjxzNhfP5O3ndNTYDguWgmL4
 1AVFKUfuUxS+zEsdqk4ZoVU/Z3qCKP0A5HiehGHyw+uywvwn1pv2WIu32AC8OmTWz3Aw
 Fb2BSPlaZ7nLipY2Xo5vgSkF8PXudl93TRuZyW8xwiq40GFcyHaHxvqpYXNeVqK/ZWlQ
 6B3hYm/n+v+9lDlbINPofyOESorqOV8igIHvTnoNc8p/8256Ygikx9J1WccIHMga4hjO
 K8EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8L4+neOpipJf7T4nuU0aYxeWoqqJ8dPZuMdLMw488ETawZE5aFvyAzvtc/bQt2mhE418uFmnEOMoCsCtdKtZt@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwPkDgamUvW41fRwgSGRLA3P6uH893ZFB6WgLfGx7VyJIjr1T6x
 kWlkZ09qkY1gMMNKSw7sTi7bqIUFRb0lOXT18IbXCG1FVeDjoKIKGpohGBRLQ9s3COfqtuVMTFy
 swrdL/EirwY0O3pXauALxAStMYscE+He5
X-Gm-Gg: ASbGncsKlZ84MRseRaEORic/bgeM7XznqWDiGsArnTmnQ/GAxLsWkUxfzs1wRFfwghG
 KlLIYf8ZsyOyLWVw1FfFttbRALF9w5413IqXrEZF6iFe+h576QHtO6OWHzLi0E+WyOtpcKcRui2
 Xq9gK3gj1k9pbb4DBu3vKA540=
X-Google-Smtp-Source: AGHT+IHXigvR+iz1rXyYwcm8ScVkZxxDgQhpjFYp4yImvcjBSY/9xrug8G/O2hIoJSz/g1lrze86FWbmVsM+0yBQUGs=
X-Received: by 2002:a05:6000:2507:b0:3a0:7119:cefa with SMTP id
 ffacd0b85a97d-3a074f83ff3mr166827f8f.16.1745557887189; Thu, 24 Apr 2025
 22:11:27 -0700 (PDT)
MIME-Version: 1.0
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 25 Apr 2025 13:11:15 +0800
X-Gm-Features: ATxdqUFatS1iiXGxNy8-bu4lcvpxokg0Vu1opAGAxPXpPt9HqYuD0P8LTUflW68
Message-ID: <CAHJ8P3KgngtQdZP-fCOM-X5-16-JgRLYJeNFc2h4zNQu6uPS9g@mail.gmail.com>
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao and Jaegeuk, I encountered a problem with node footer
 data being corrupted on an Android device.(kernel version 6.6 and android
 version:15) after I merged the following patches, the problem still exists.
 https://g [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [niuzhiguo84[at]gmail.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.221.48 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.221.48 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.48 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.48 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1u8BLe-0000wt-Sr
Subject: [f2fs-dev] f2fs node footer data corruption in Android device
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

Hi Chao and Jaegeuk,

I encountered a problem with node footer data being corrupted on an
Android device.(kernel version 6.6 and android version:15)
after I merged the following patches, the problem still exists.
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?h=dev-test&id=eba08414c585f90760c4312f57dea78ea45cb5cb
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/fs/f2fs?h=dev-test&id=19426c4988aa85298c1b4caf2889d37ec5c80fea
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/fs/f2fs?h=dev-test&id=c2ecba026586cda6c7dc0fe9e6e60e7e9386c3bd
and there is no nat_bits in mount option.

I am still debugging, and would like to ask do you have any other
hints or suggestions?
The issue seem to be closely related to adb remount.

test steps:
ping 127.0.0.1 -n 20 > nul
adb.exe -s mydevice  wait-for-device
adb.exe  -s mydevice reboot bootloader
fastboot -s mydevice  erase userdata
fastboot -s mydevice  erase cache
fastboot -s mydevice  reboot
ping 127.0.0.1 -n 30 > nul
adb.exe -s mydevice wait-for-device
adb.exe -s mydevice root
adb.exe -s mydevice remount
adb.exe -s mydevice shell   rm -rf /data/somefile/*

dmesg:
dm-59: userdata partition, dm-7: scratch image partition is for adb remount
[    3.893630] F2FS-fs (dm-59): Using encoding defined by superblock:
utf8-12.1.0 with flags 0x0
[    3.930213] F2FS-fs (dm-59): Mounted with checkpoint version = 38485b2d
[   20.584169] F2FS-fs (dm-7): Mounted with checkpoint version = 42130ef
[   38.039122] F2FS-fs (dm-59): inconsistent node block, nid:1426,
node_footer[nid:129565021,ino:2756062298,ofs:26782845,cpver:6421703165179826912,blkaddr:3577851147]
[   38.048310] F2FS-fs (dm-59): inconsistent node block, nid:1426,
node_footer[nid:129565021,ino:2756062298,ofs:26782845,cpver:6421703165179826912,blkaddr:3577851147]
[   38.051725] F2FS-fs (dm-59): inconsistent node block, nid:1426,
node_footer[nid:129565021,ino:2756062298,ofs:26782845,cpver:6421703165179826912,blkaddr:3577851147]
thanks


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
