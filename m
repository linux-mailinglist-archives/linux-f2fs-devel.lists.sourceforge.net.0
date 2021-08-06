Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD41E3E22CB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 07:12:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBs9F-0006cp-Cy; Fri, 06 Aug 2021 05:11:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=845ab97a1=damien.lemoal@wdc.com>)
 id 1mBs9C-0006cU-MN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 05:11:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yRHnOuFegd6UaLvsZx6ilRbSoLCfYMPohGhbs4s+8EQ=; b=G9hHJrD+mz90V2bN1+amHg3VKS
 +oy740PknBIerAawAXDnyfQCw4AMzePddRcUc6HoBGa4NrZOh/lsV52wB2QpErrfx2U/mV6B7auWE
 yEOVzITy7WMmes7XwTB1TWpLA2PHtU9Qmc/+8PPksTM0dEoQCuWzJGe3Z5hYI6g7UKQQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
 Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yRHnOuFegd6UaLvsZx6ilRbSoLCfYMPohGhbs4s+8EQ=; b=W
 n/gewxQ6aUT103uisJMzefFI/aCe3/qrYqFBROVe8s/ov1PzPZr+7QFxs/2iAyqhIBUDzs9rLeX5J
 r17K68TxyYBGVRvzv1+0JaTeKauMhpsCHWzR2r/COiNZr5I3/IUor1/f5VNCD5LU/mk6t6VenjU+F
 TTmfvpWz/bt8TirE=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBs98-0003LZ-2G
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 05:11:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628226708; x=1659762708;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gNBdiDD6x/yNjv/Ff1lf1OHWLKH/Q4+rYKGZ6B1EdjE=;
 b=cAz6YKLa0r1Jgsdv2Uf6NqSTAn54niAcQ3JVQ3sc0P33VsT1P/1Tq96s
 UGVpYQ+uOhzN7eFesC3AIfD6GBQSXuTREMI72nFC3Eo7zCaxVGsSjkXt3
 jhTk1KBOK3HwikQgJ5kGL65NnRTB1FAslQ145hpnqrT3srdeo/fJm6F3u
 KVDe5A8bwVpr3KGckPUbj+LRJVnOk3jJ/2YXLw9qW0F4Qei8pFJf7VPxc
 AgGgQBcCzeWGZFrZlvEc/sEk8zOdel6/syEb1RDFmEmakH0FlfVgmYd3R
 UHoWIAmjc8+pY078esjGia0ObhIhrVHkfCAiWMXu19M1HZrZM8lE6RnWT Q==;
X-IronPort-AV: E=Sophos;i="5.84,299,1620662400"; d="scan'208";a="181285572"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Aug 2021 13:11:43 +0800
IronPort-SDR: XmWgv2xVIVnZkyG73hMv8/IIdnZzv/ryl+GkluR7MbBIHk0gXHY0lbjJ41URlvO/vBJ/3u5e+t
 eWISO9yOn0U0l2V+H927YIW2odYbUm9yLWAJDrN5gk2jBRU22Lv0ArPYWqV8W6fnddl5jvFQEV
 rQEcPNk5+GLc24r9FIUmTt8pfzVYuQ3y46qb7nB2hLuWVhAMqhab/Hfjgedu7KOR6P3Y2uI0oJ
 dAJvI7+nb66r+ZohTF2RWnmnB20lnfB3YFlhpnoHruagI+iqaVXldtghIaNAwlQJdpnF0MY4dF
 ZL3tvJFP/s7brbOdwEuUSGoX
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2021 21:47:20 -0700
IronPort-SDR: Dasbz1sPEb225juJaMs5Lc3oN/myHAeiFF0S+7T+7mg0CeEADTCOLBbxt+JBqz3EysSoIeJ76y
 ym8aepy/zZCj1mvI1xL2yZkn61iWUnaD+tXjcY0TFT312+b7pKlMMWf3sHtEBc0AZXJeHQffGl
 GQPM6093S6hULmCfZJ21Zl/iQqFpI/gAbEQ/K8bS9/ZncYtnpARmlPn6s4w3oGbRhqgo4qiu4r
 rPZqlRlduk7jJqNu39z9wslfrTp+Sz2Eee+kfTJtpyjQQk0JlrG3AbLXFVG3C9lTPxkEfeGNCZ
 ujQ=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 Aug 2021 22:11:43 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Date: Fri,  6 Aug 2021 14:11:36 +0900
Message-Id: <20210806051140.301127-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [216.71.153.141 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mBs98-0003LZ-2G
Subject: [f2fs-dev] [PATCH v2 0/4] IO priority fixes and improvements
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

This series fixes problems with IO priority values handling and cleans
up several macro names and code for clarity.

Changes from v1:
* Added patch 4 to unify the default priority value used in various
  places.
* Fixed patch 2 as suggested by Bart: remove extra parenthesis and move
  ioprio_valid() from the uapi header to the kernel header.
* In patch 2, add priority value masking.

Damien Le Moal (4):
  block: bfq: fix bfq_set_next_ioprio_data()
  block: fix ioprio interface
  block: rename IOPRIO_BE_NR
  block: fix default IO priority handling

 block/bfq-iosched.c          | 10 +++++-----
 block/bfq-iosched.h          |  4 ++--
 block/bfq-wf2q.c             |  6 +++---
 block/ioprio.c               |  9 ++++-----
 drivers/nvme/host/lightnvm.c |  2 +-
 fs/f2fs/sysfs.c              |  2 +-
 include/linux/ioprio.h       | 22 ++++++++++++++++++----
 include/uapi/linux/ioprio.h  | 23 +++++++++++++----------
 8 files changed, 47 insertions(+), 31 deletions(-)

-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
