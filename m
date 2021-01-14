Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ED32F5B99
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Jan 2021 08:54:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kzxSJ-0005ge-FV; Thu, 14 Jan 2021 07:54:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mchehab@kernel.org>) id 1kzxSI-0005gY-LA
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Jan 2021 07:54:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rZHOKWB+9rM+ZlhqnnEm3U3UqoIUvrhJQ1kvEtTRLbM=; b=CzmCVlXzNv6qokvG7AR838ROAt
 aH9owSUvp26gEa6kkWNv/pN2GdcvERO06eS3E6JSvvgjOOFRdwqd2xPtYU8ZmUr/YFJCS8it1ewUd
 4dG7p2rA6jBko3B54R6w0gXRu4YxQO1YR/PrQGsFZrPyQNc9zbdXM7TiGGu3tpmkpwtQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rZHOKWB+9rM+ZlhqnnEm3U3UqoIUvrhJQ1kvEtTRLbM=; b=U
 3Bg3sPSrB1eLsn0BdC3cDlstvpJS1SsJu9FUXP01ecNI6HOh9eti5J5gZkAMw6a8eXLg6coaaahsA
 JlA5dqBJWfaAo7pUODSqv2uW8vo0qoxcIkCQu5ll76woeUZ8D2QfesGrkw5OPQkTlq3nm7SosdGia
 i0geF/PfUBPYmTMY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kzxSC-00EdjH-J7
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Jan 2021 07:54:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4C4C239EF;
 Thu, 14 Jan 2021 07:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610610830;
 bh=BXt2olIMSsLtD8I2dioNC1dF1gnxlCbQs+WN6FCb4nE=;
 h=From:To:Cc:Subject:Date:From;
 b=s0XxntmYYJHZOMEV2ezXMlavrLQamHOON6XCuxktQJvVAECs99C5z/1aJ9vJhpL8u
 ooeeAl2QTMZNzf+wMfEpKpWg40tk1M0qnksP48Wj5LotBytvL5l6d4s7r5DnGwrSaG
 EH99zAztLa1B6MMeto4xMR8BJQ0ZLi5vAvwqfqQhhWEPmUUPibd3hUMclqtKjDn9OB
 Utpv0Ju4+AOG0dmdSki7FZM9GtjIWxV8jruDU/sDouAY8GwvD2n2HBSlFqfv/WWpXP
 DJr7Fq0cZK3daZV+WRhSNlCFNyWFUZ+j72ACR35krQCcJ9iaizMmnvIhYttJJ/HyQS
 YKU4ctJMp8S5g==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kzxRz-00EPu1-2O; Thu, 14 Jan 2021 08:53:47 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Thu, 14 Jan 2021 08:53:35 +0100
Message-Id: <cover.1610610444.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kzxSC-00EdjH-J7
Subject: [f2fs-dev] [PATCH 00/10] Fix documentation warnings at linux-next
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Harry Wei <harryxiyou@gmail.com>,
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 amd-gfx@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, linux-media@vger.kernel.org,
 Moritz Fischer <mdf@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Daniel Vetter <daniel@ffwll.ch>,
 Wu Hao <hao.wu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series fixes the documentation warnings found at next-20210114.

Most of the changes here are trivial. 

While those patches could be merged via the docs tree during
the next merge window, It sounds better to have those patches 
merged directly via each maintainer's tree, where the new
warnings were introduced.

Regards,
Mauro

Mauro Carvalho Chehab (10):
  doc/zh_CN: fix Sphinx errors
  ABI: sysfs-fs-f2fs: fix a table identation
  KVM: x86: hyper-v: add a blank line to remove building warnings
  ABI: sysfs-firmware-sgi_uv
  docs: fpga: dfl.rst: Fix a couple building issues
  drm: amd: amdgpu_dm.h: fix a wrong kernel-doc markup
  dwc3: document gadget_max_speed
  doc: zh_CN/mips: fix doc cross-references
  media: v4l2-subdev.rst: fix a missing whitespace
  seqlock: kernel-doc: fix a prototype

 Documentation/ABI/testing/sysfs-firmware-sgi_uv       | 1 +
 Documentation/ABI/testing/sysfs-fs-f2fs               | 3 ++-
 Documentation/driver-api/media/v4l2-subdev.rst        | 2 +-
 Documentation/fpga/dfl.rst                            | 4 ++--
 Documentation/translations/zh_CN/mips/booting.rst     | 2 +-
 Documentation/translations/zh_CN/mips/features.rst    | 2 +-
 Documentation/translations/zh_CN/mips/index.rst       | 2 +-
 Documentation/translations/zh_CN/mips/ingenic-tcu.rst | 6 +++---
 Documentation/virt/kvm/api.rst                        | 1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h     | 2 +-
 drivers/usb/dwc3/core.h                               | 1 +
 include/linux/seqlock.h                               | 2 +-
 12 files changed, 16 insertions(+), 12 deletions(-)

-- 
2.29.2




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
