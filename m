Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1353FBEAD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Nov 2019 05:45:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iV70F-0007aO-5d; Thu, 14 Nov 2019 04:45:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2145628f9=shinichiro.kawasaki@wdc.com>)
 id 1iV70E-0007a0-7Y
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 04:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0qGxORlAE1o19G0CPu7inj3LmY82XzceExZ8M+vyrYk=; b=dXHcMfu4KAtlQ69AToYekbO6ZQ
 jMWHVmIPsriPiQ+euiZ6tdg94g+u46bPG+PGgG/Lcqi5+jJtc641ce1XatOPpL9rwTwi0rOyqgW2z
 qQGWpgm+txhT0cSFYjbc9e1xw44WUGZuNpwFHiwV01xTcf08ZIz+XuBCNYPdr6uIVPa0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0qGxORlAE1o19G0CPu7inj3LmY82XzceExZ8M+vyrYk=; b=fsugJ5yT9C1FM8dghTXXPrl0Dz
 sOyTmvHdB5OzIiLMV4jBZO9+5Nl5j+1RdsdzvVnjxz0DI1UPf7X6ktZqgwY7DXhqDoqQUWnCawEhv
 adICBzoNG63iMZqK7DLOYvl30a4CS2KmqB5UhJH1xmYDXrXEcGrMycUjtnexhuj7EmYw=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iV70C-002ZCm-Pf
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 04:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573706705; x=1605242705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ShoovgzA0HAJlXJap2fWnvwaPOkx3IqpKZVMueSwvK8=;
 b=LqMvW8lpZezUbcRjJvUesWg/aNZUpPNaUoX1TCca1EM9e7DAZoq7y0N0
 kfm05/utreaA7XbwksMw3htdOopQw1H+Etb6mbrCJPQX8GYY1UqoVuJkb
 gN7gesDtNOUbRfnk0wLn7xrrxOzNB1iVudLtWBLowSTFlcKSJTiZ5bxrR
 /GfFZmlCdZGXSPb+HsqvhhQP5mxz06VNYdWRT9BHg1kbJ39q8ICmdPqO1
 GrjA3Vy8tMeVJfujnS3P/DNduA5M5EiRMuD3GP9a9rgSXEMYA677txbRI
 opgIfgXNiPKR/Prb7j+VOBTFOR/z2VdJEiptQxR++nrn3jvXXMj2YfHPB A==;
IronPort-SDR: uAkbuU2kw7wYxr522fOO6yCD1lUMYhL/WDGWEmw0MjMhAp24CYDikxvASP+Cg0dmfPl+YFyxiF
 fTUzqMy1oHnOuijgFIiZ3rc6dggDfOdy8sO8nGKCr4ymm+/Rt2gBfH95P9tSpacASk1OoMYteO
 vKGHaF6YCrmgw4lgyFISPOtZk/Tmnu0lEcC2Azrp8RFLODKDPqKMj4zr04kvsfo0ugioJPYNwx
 L7nTgZLQxBNreuGGj1LSl3MX3qIQfYSdDjAAbEQ+VrxXwBeoGvSKlMmhY3RgCVRn53Nx2sO/fj
 TVE=
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; d="scan'208";a="127411446"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2019 12:45:00 +0800
IronPort-SDR: Fs29PPTk3SHM9/vVMduw5FbvzIqlYtfKjo3/Hq2JnTSgiQI/ECDx/t0Mpqg0FVVC//LHuASL9I
 JdrAFt1942fVTSD1h8K3wPUyOZJjsmYq50goooZTdd32T1vah5orEa3ijPk5605zBBRMyj6pX9
 0BmDG0Cv9+ZwBAOsyXYymn0TalGrG/k1NRVbtjQeW+NS9GVnUUCE+wAJ7jW1yEvPw6y3jtfm5J
 7ZAgpbxzuEEbjUSRKhN9Rr20vU3J3gqv+6SE4FBTxconEn8BoEsRXNbSesfGOmAtzim+kK8tRC
 1dlGh3wFAdApEfxLombKJWEa
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 20:39:59 -0800
IronPort-SDR: 3jgT/8X7EK1sDlPjsTG1fd4Q1oLLuM9rE4JW/dwLwW/Ztx3WD/L+Vrhg2XvsMOshLFosnOZkDu
 JvZI6Y2rhjifiS8W6o94LEXHt/T9+XpXDmppoNbMZZWjg6hzWRPsRdJKT1GIiYWNY+7VUqXvJl
 JW8wmvufvncMYU2RQ1ZtTXT3P1IpJ622j5jeRJ75a4kjhfOtVChRCgt192xSDcJBUOimWdJ87l
 O2blGvNE0G0HM2t00b3SWTawBu1opN/m7r3AwkSSEtc1F2urDJ/2wnrqZQtqcU0VM/cHUFRaNL
 pvo=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Nov 2019 20:45:00 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 14 Nov 2019 13:44:48 +0900
Message-Id: <20191114044454.200461-3-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114044454.200461-1-shinichiro.kawasaki@wdc.com>
References: <20191114044454.200461-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iV70C-002ZCm-Pf
Subject: [f2fs-dev] [PATCH v7 2/8] libf2fs_zoned: Introduce
 f2fs_report_zone() helper function
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

To prepare for write pointer consistency check by fsck, add
f2fs_report_zone() helper function which calls REPORT ZONE command to
get write pointer status of a single zone. The function is added to
lib/libf2fs_zoned which gathers zoned block device related functions.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 include/f2fs_fs.h   |  1 +
 lib/libf2fs_zoned.c | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index fe18dff..d6ea688 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1319,6 +1319,7 @@ blk_zone_cond_str(struct blk_zone *blkz)
 
 extern int f2fs_get_zoned_model(int);
 extern int f2fs_get_zone_blocks(int);
+extern int f2fs_report_zone(int, u_int64_t, void *);
 typedef int (report_zones_cb_t)(int i, void *, void *);
 extern int f2fs_report_zones(int, report_zones_cb_t *, void *);
 extern int f2fs_check_zones(int);
diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index 8ad4171..5328c56 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -191,6 +191,33 @@ int f2fs_get_zone_blocks(int i)
 	return 0;
 }
 
+int f2fs_report_zone(int i, u_int64_t sector, void *blkzone)
+{
+	struct blk_zone *blkz = (struct blk_zone *)blkzone;
+	struct blk_zone_report *rep;
+	int ret = -1;
+
+	rep = malloc(sizeof(struct blk_zone_report) + sizeof(struct blk_zone));
+	if (!rep) {
+		ERR_MSG("No memory for report zones\n");
+		return -ENOMEM;
+	}
+
+	rep->sector = sector;
+	rep->nr_zones = 1;
+	ret = ioctl(c.devices[i].fd, BLKREPORTZONE, rep);
+	if (ret != 0) {
+		ret = -errno;
+		ERR_MSG("ioctl BLKREPORTZONE failed: errno=%d\n", errno);
+		goto out;
+	}
+
+	*blkz = *(struct blk_zone *)(rep + 1);
+out:
+	free(rep);
+	return ret;
+}
+
 #define F2FS_REPORT_ZONES_BUFSZ	524288
 
 int f2fs_report_zones(int j, report_zones_cb_t *report_zones_cb, void *opaque)
@@ -425,6 +452,12 @@ out:
 
 #else
 
+int f2fs_report_zone(int i, u_int64_t sector, void *blkzone)
+{
+	ERR_MSG("%d: Unsupported zoned block device\n", i);
+	return -1;
+}
+
 int f2fs_report_zones(int i, report_zones_cb_t *report_zones_cb, void *opaque)
 {
 	ERR_MSG("%d: Unsupported zoned block device\n", i);
-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
