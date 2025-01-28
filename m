Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C764CA20232
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Jan 2025 01:07:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tcZ8P-0007GL-OI;
	Tue, 28 Jan 2025 00:07:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mchehab+huawei@kernel.org>) id 1tcZ8O-0007Ff-Ie
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Jan 2025 00:07:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:MIME-Version:
 Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4nS+zcLGjC94QdNZM5xUIENfjbztQuxI85OTjKJkWDE=; b=kQ4G4L6E0nleVrt5Mnp62lLJW+
 2L++cnVLC3h4MQIVZvkoVJ8iNJKGunm6XeKj8J8ER9BraPfq1VERjQpzSMefBhE/2GBUXPdn59F2x
 s8eGMskRCIBPSILB8GfBqsIcI/aVVi6E6m2dL/Ah4VJ4op/BLUJtXraofmrvMS6lIJhQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4nS+zcLGjC94QdNZM5xUIENfjbztQuxI85OTjKJkWDE=; b=b
 mGQvdDJMAwuvhicZX1dhR6HxrUaykK5QHb/b/039bxesVBVFU2S/csdFA65E4h4pPM7tG1YeQLAVp
 GTF8aySmhZV5JXc/p/3cDg3tCHhcMoD0qgOWhmcctS4mnI/QSpVSa9s5kRv4YflfGJFGzN99b5QG1
 Rnc4JdCkOePakFJs=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tcZ7v-0007sY-QA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Jan 2025 00:06:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 28F90A41634;
 Tue, 28 Jan 2025 00:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0CDC4CEE7;
 Tue, 28 Jan 2025 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738022796;
 bh=x0APBPBQWrivChaCg4k0Jly7N3L+drRwEE2afrYm3Ko=;
 h=From:To:Cc:Subject:Date:From;
 b=YVMdUUsPMxPbkAk4qEzxydaiheiKgPq0V/bec3NjHqtsuNI4LbgEBDEej9+LgNza+
 ljIEnlJ8dOW66epiiZtLELOhM7CI9Xmfl04mwJsxOPi5DZqupGOzyLYI8OrEB0YMLK
 2aabCdo/efDt+1ketrNTclboOiYMqtBF3chVGB2EMC4yfr4ULHJGHphSkN/9c0uXJr
 2zeCibWgf8wkOz10yK0tDHg/2UyTNfnmjDli87oee4K3CFTkaD0PhvQA9VygWXf7kB
 Qo1Ry12uzmRsVIoEnhnI2jD01cboTneK2GBz8V4u2Zk1oJeS56JxjuAeS7Lo5BEMUu
 9jWWaNQP5ViKg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tcZ7h-0000000DRKO-2KyQ; Tue, 28 Jan 2025 01:06:33 +0100
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 28 Jan 2025 01:05:49 +0100
Message-ID: <cover.1738020236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jon/Greg,
 That's the second version of my RFC patches meant
 to modenize the ABI parser that I wrote in Perl. I originally started it
 due to some issues I noticed when searching for ABI symbols. While I could
 just go ahead and fix the already existing script, I noticed that the script
 maintainance didn't have [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tcZ7v-0007sY-QA
Subject: [f2fs-dev] [RFC v2 00/38] Improve ABI documentation generation
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
From: Mauro Carvalho Chehab via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-pm@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 netdev@vger.kernel.org, coresight@lists.linaro.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-hardening@vger.kernel.org,
 workflows@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jon/Greg,

That's the second version of my RFC patches meant to modenize the ABI
parser that I wrote in Perl.

I originally started it due to some issues I noticed when searching for
ABI symbols. While I could just go ahead and fix the already existing
script, I noticed that the script maintainance didn't have much care over
all those years, probably because it is easier to find Python programmers
those days.

Also, the code is complex and was not using modules or classes and
were using lots of global variables.

So, I decided to rewrite it in Python. I started with a manual conversion
for each function. Yet, to avoid future maintainership issues, I opted to
divide the code on three classes. One class for the ABI parser, another
one for regex conversion (used when checking symbols from local hardware,
and an extra class for undefined symbols check.

I opted to change the Sphinx integration gradually using different
patch sets on 4 phases:

1. minimal integration: just execute the new script on a similar way as
   the perl one;
2. the kernel_abi module was changed to import the ABI parser class,
   using it directly;
3. the logic at kernel_abi were rewritten to better integrate. As a bonus,
   Sphinx now imports ReST data symbol by symbol. That solves one of
   the issues I was discomfortable with the original approach: when lots
   of data is sent to Sphinx parser, it stops in the middle of processing.
   This was addressed in the past on a hacky way, but it could cause
   problems in the future as the number of symbols increase;
4. the ABI parser part is now called either by automarkup and kernel_abi.
   This allowed automarkup to solve ABI symbols.

Together with this series, I added some patches fixing issues and warnings
when generating documentation.

Some notes about this new RFC:

- despite being able to generate documentation cross-references with
  auto-markup, the documentation build timt didn't increase on my machine
  (it was actually 5 seconds faster);
- I rewrote some algorithms at the undefined symbol detection code. With
  that, it is now a lot faster than the previous version, at least on my desktop
  (wich has 24 CPU threads). I didn't try it on a server yet;
- the undefined parser can optionally use multiple CPUs. This sounds
  fancier than it seems: Python (up to version 3.12) is really bad with
  multi-CPU support and doesn't have real multi-thread support. Python
  3.13 has now an optional way to address that (although I didn't test yet,
  as it requires Python manual compilation). When such feature becomes
  standard, maybe the undefined symbols detection will be faster.

Btw, I'm opting to send this as an RFC because I'd like to have more
people testing and checking it. In particular, the undefined ABI check
is complex, as it requires lots of tricks to reduce the run time from hours
to seconds.
  
On this series we have:

patches 1 to 11: several bug fixes addressing issues at ABI symbols;
patch 12: a fix for scripts/documentation-file-ref-check
patches 13-15: create new script with rest and search logic and 
  minimally integrate with kernel_abi Sphinx extension(phase 1);
patches 16-19: implement phase 2: class integration (phase 2);
patch 20: fix a bug at kernel_abi: the way it splits lines is buggy;
patches  21-24: rewrite kernel_abi logic to make it simpler and more
  robust;
patches 25-27: add cross-reference support at automarkup;
patches 28-36: several ABI cleanups to cope with the improvements;
patch 37: implement undefined command;
patch 38: get rid of the old Perl script.

To make it easier to review/apply, I may end breaking the next version
on a couple of different patchsets. Still it would be nice to have more
people testing it and providing some feedback.

---
RFC v2:
  - Dropped a patch touching the perl script;
  - Implemented phases 2-4 of the script's logic;
  - Added ABI cross-references via automarkup;
  - Added support for undefined logic;
  - Added more ABI and scripts' fixes;
  - Added undefined logic;
  - Added a patch to remove the old tool.

Mauro Carvalho Chehab (38):
  docs: power: video.rst: fix a footnote reference
  docs: media: ipu3: fix two footnote references
  docs: block: ublk.rst: remove a reference from a dropped text
  docs: sphinx: remove kernellog.py file
  docs: sphinx/kernel_abi: adjust coding style
  docs: admin-guide: abi: add SPDX tags to ABI files
  ABI: sysfs-class-rfkill: fix kernelversion tags
  ABI: sysfs-bus-coresight-*: fix kernelversion tags
  ABI: sysfs-driver-dma-idxd: fix date tags
  ABI: sysfs-fs-f2fs: fix date tags
  ABI: sysfs-power: fix a what tag
  scripts/documentation-file-ref-check: don't check perl/python scripts
  scripts/get_abi.py: add a Python tool to generate ReST output
  scripts/get_abi.py: add support for symbol search
  docs: use get_abi.py for ABI generation
  scripts/get_abi.py: optimize parse_abi() function
  scripts/get_abi.py: use an interactor for ReST output
  docs: sphinx/kernel_abi: use AbiParser directly
  docs: sphinx/kernel_abi: reduce buffer usage for ABI messages
  docs: sphinx/kernel_abi: properly split lines
  scripts/get_abi.pl: Add filtering capabilities to rest output
  scripts/get_abi.pl: add support to parse ABI README file
  docs: sphinx/kernel_abi: parse ABI files only once
  docs: admin-guide/abi: split files from symbols
  docs: sphinx/automarkup: add cross-references for ABI
  docs: sphinx/kernel_abi: avoid warnings during Sphinx module init
  scripts/get_abi.py: Rename title name for ABI files
  docs: media: Allow creating cross-references for RC ABI
  docs: thunderbolt: Allow creating cross-references for ABI
  docs: arm: asymmetric-32bit: Allow creating cross-references for ABI
  docs: arm: generic-counter: Allow creating cross-references for ABI
  docs: iio: Allow creating cross-references ABI
  docs: networking: Allow creating cross-references statistics ABI
  docs: submit-checklist: Allow creating cross-references for ABI README
  docs: translations: Allow creating cross-references for ABI README
  docs: ABI: drop two duplicate symbols
  scripts/get_abi.py: add support for undefined ABIs
  scripts/get_abi.pl: drop now obsoleted script

 Documentation/ABI/removed/sysfs-class-rfkill  |    2 +-
 Documentation/ABI/stable/sysfs-class-rfkill   |   12 +-
 .../ABI/stable/sysfs-devices-system-cpu       |   10 -
 .../ABI/stable/sysfs-driver-dma-idxd          |    4 +-
 .../testing/sysfs-bus-coresight-devices-cti   |   78 +-
 .../testing/sysfs-bus-coresight-devices-tpdm  |   52 +-
 Documentation/ABI/testing/sysfs-fs-f2fs       |    4 +-
 Documentation/ABI/testing/sysfs-power         |    2 +-
 .../admin-guide/abi-obsolete-files.rst        |    7 +
 Documentation/admin-guide/abi-obsolete.rst    |    6 +-
 Documentation/admin-guide/abi-readme-file.rst |    6 +
 .../admin-guide/abi-removed-files.rst         |    7 +
 Documentation/admin-guide/abi-removed.rst     |    6 +-
 .../admin-guide/abi-stable-files.rst          |    7 +
 Documentation/admin-guide/abi-stable.rst      |    6 +-
 .../admin-guide/abi-testing-files.rst         |    7 +
 Documentation/admin-guide/abi-testing.rst     |    6 +-
 Documentation/admin-guide/abi.rst             |   17 +
 Documentation/admin-guide/media/ipu3.rst      |   12 +-
 Documentation/admin-guide/thunderbolt.rst     |    2 +-
 Documentation/arch/arm64/asymmetric-32bit.rst |    2 +-
 Documentation/block/ublk.rst                  |    2 -
 Documentation/driver-api/generic-counter.rst  |    4 +-
 Documentation/driver-api/iio/core.rst         |    2 +-
 Documentation/iio/iio_devbuf.rst              |    2 +-
 Documentation/networking/statistics.rst       |    2 +-
 Documentation/power/video.rst                 |    2 +-
 Documentation/process/submit-checklist.rst    |    2 +-
 Documentation/sphinx/automarkup.py            |   56 +
 Documentation/sphinx/kernel_abi.py            |  162 +-
 Documentation/sphinx/kerneldoc.py             |   14 +-
 Documentation/sphinx/kernellog.py             |   22 -
 Documentation/sphinx/kfigure.py               |   81 +-
 .../it_IT/process/submit-checklist.rst        |    2 +-
 .../sp_SP/process/submit-checklist.rst        |    2 +-
 .../zh_CN/process/submit-checklist.rst        |    2 +-
 .../zh_TW/process/submit-checklist.rst        |    2 +-
 .../userspace-api/media/rc/rc-sysfs-nodes.rst |    2 +-
 scripts/documentation-file-ref-check          |    2 +-
 scripts/get_abi.pl                            | 1103 -------------
 scripts/get_abi.py                            | 1437 +++++++++++++++++
 41 files changed, 1804 insertions(+), 1354 deletions(-)
 create mode 100644 Documentation/admin-guide/abi-obsolete-files.rst
 create mode 100644 Documentation/admin-guide/abi-readme-file.rst
 create mode 100644 Documentation/admin-guide/abi-removed-files.rst
 create mode 100644 Documentation/admin-guide/abi-stable-files.rst
 create mode 100644 Documentation/admin-guide/abi-testing-files.rst
 delete mode 100644 Documentation/sphinx/kernellog.py
 delete mode 100755 scripts/get_abi.pl
 create mode 100755 scripts/get_abi.py

-- 
2.48.1




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
