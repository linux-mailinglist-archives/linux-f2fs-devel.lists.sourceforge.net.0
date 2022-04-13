Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A054FF6D5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Apr 2022 14:30:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nec8D-0000CM-A2; Wed, 13 Apr 2022 12:29:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1nec8B-0000C6-9R
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 12:29:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8tceLpQCZY8XtXPcoFL1bD1vU5G4FDe/1Ig7REroJXA=; b=G+doMGg+zGbnJRTh60QA+ZvCGn
 JbuYMXkrXFWyVEtWShgzuaL/8oDQz/+jT9ErjwT7nNXz0QR63uH6H4MtRMJ+/2/5FyEzzDMbj8Jv/
 1E+KbqOk+n1TpRSmN1zm7REZNSbrqF6LQx1keUZgRQf5oh6b8n3GgZk0bfCwKoMtY9uM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8tceLpQCZY8XtXPcoFL1bD1vU5G4FDe/1Ig7REroJXA=; b=V
 XIp4NctsA6/yxFgEFwvdVIhBKnMaemNRJc3UN+0Ib6Rcd+OUnT84aR4LUzCYib4dk/JBJvDpwQnaC
 TL8RCdPRS8x0abVTkGaVIsOvlL5BWHDqWwGPRzTcTV3sr1t1xQW7QaBE3i5EEKvz4hJHbVMlxQvUY
 qTyhoJi3Uz9ZFVo0=;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nec88-0000kg-25
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 12:29:54 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220413122942euoutp0202a4a74eda647f885832b33b98636e5a~ldIvZntgu0776207762euoutp02h
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 Apr 2022 12:29:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220413122942euoutp0202a4a74eda647f885832b33b98636e5a~ldIvZntgu0776207762euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1649852982;
 bh=8tceLpQCZY8XtXPcoFL1bD1vU5G4FDe/1Ig7REroJXA=;
 h=From:To:Cc:Subject:Date:References:From;
 b=YnB2ER6IraJk9D5LhxymTG4ZpayYBMdrOi/ABiRElYyHZn9V++m1zUB9qOusHreJz
 fUQzYX4etkc5EA/AEXfJTQXzrydy0aB1gfQXMRYzD55HEcfiEP1PulNda8T+RWdkK4
 Jhbk/zunmYomz59sg8qA2Q580N7SMZL3KgHlEdlk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220413122941eucas1p18ae16aaaf33eddc1590815e70278057c~ldIuy-4to1480414804eucas1p1A;
 Wed, 13 Apr 2022 12:29:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id FB.FF.10260.532C6526; Wed, 13
 Apr 2022 13:29:41 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220413122941eucas1p1ec05e8e8dfe2baf451fcb549d60fda35~ldIuT-wvG1000610006eucas1p1v;
 Wed, 13 Apr 2022 12:29:41 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220413122941eusmtrp24d0a4f8986c1443744045953cd30cec3~ldIuTJ9U10748907489eusmtrp2w;
 Wed, 13 Apr 2022 12:29:41 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-8e-6256c23576a0
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A9.FD.09522.532C6526; Wed, 13
 Apr 2022 13:29:41 +0100 (BST)
Received: from localhost (unknown [106.210.248.178]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20220413122940eusmtip173c8d6a57ad0f4a2856b8f0f3677a438~ldIt-82rA1762317623eusmtip1j;
 Wed, 13 Apr 2022 12:29:40 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 13 Apr 2022 14:29:40 +0200
Message-Id: <20220413122940.133981-1-p.raghav@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleLIzCtJLcpLzFFi42LZduznOV3TQ2FJBtu3aVu0tn9jsnh85zO7
 xdH/b9ksLi1yt7gx4SmjxeelLewWa24+ZXFg99g56y67x6ZVnWweuxd8ZvLo27KK0aP9QDdT
 AGsUl01Kak5mWWqRvl0CV8bJXy9YCp4rVOx7w9/AeE+yi5GTQ0LARGLW60tMXYxcHEICKxgl
 flxZzAjhfGGUePZ4M5TzmVHi45cFjDAt9yYdhGpZzigxdVM/M4TzklFi+fEmoAwHB5uAlkRj
 JztIgwiQObHhL1gzs8B0Rok7f1xBSoQFwiQ+9dSBhFkEVCWe3LjCBmLzClhJrLrYzAKxS15i
 5qXv7BBxQYmTM5+wQIyRl2jeOhtsrYTAXA6J3k9drBANLhLLfi+HOlRY4tXxLewQtozE/53z
 mSDsaomnN35DNbcwSvTvXM8GcpCEgLVE35kcEJNZQFNi/S59iKijxL8+HgiTT+LGW0GIC/gk
 Jm2bzgwR5pXoaBOCmK0ksfPnE6idEhKXm+ZAPeIhcffSW2YQW0ggVmLmzU+MExgVZiH5axaS
 v2YhnLCAkXkVo3hqaXFuemqxcV5quV5xYm5xaV66XnJ+7iZGYIo5/e/41x2MK1591DvEyMTB
 eIhRgoNZSYS3Xz00SYg3JbGyKrUoP76oNCe1+BCjNAeLkjhvcuaGRCGB9MSS1OzU1ILUIpgs
 EwenVANTmmm3859vf/O8w2zDnLXvMa3fZs+quLBq9wZfo9v2ckqW/Tr/0o0qOI7PXfj3XtnX
 9SfLG69qrC+6+I5nir22s7j3p+mz1nQ3n+qd6BG5VNVx806xKUt0s75surVGqVsz2Tj0zE+b
 DfECP0UOiLxPN2K5/Lv/IVPyyf5Np0o+fM51+8uptCyuOcP58V1zX97TWrnhDOLNrzSeNPfv
 8JhSs1Hyw7biTuWncyWXF0y8GlXR/8dqa2uwwWuODclpqj2KfPs3B1T3RMttvDlje8WyJ4yn
 ttd7TkjdcdAmwDhtv8ab5TuYdva5hpdlfu14sV6wxsv7i++lIs1MQTs+qaQ0/QzOzJbdX+Xu
 pGdv4FNiKc5INNRiLipOBAA3jLm6oAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsVy+t/xu7qmh8KSDF6f4bVobf/GZPH4zmd2
 i6P/37JZXFrkbnFjwlNGi89LW9gt1tx8yuLA7rFz1l12j02rOtk8di/4zOTRt2UVo0f7gW6m
 ANYoPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYyT
 v16wFDxXqNj3hr+B8Z5kFyMnh4SAicS9SQeZuhi5OIQEljJKnNo6hwkiISFxe2ETI4QtLPHn
 WhcbRNFzRonO39uAEhwcbAJaEo2d7CA1IkDmxIa/jCA1zALzGSW27VnEApIQFgiR2P3qJFgR
 i4CqxJMbV9hAbF4BK4lVF5tZIBbIS8y89J0dIi4ocXLmE7A4M1C8eets5gmMfLOQpGYhSS1g
 ZFrFKJJaWpybnltsqFecmFtcmpeul5yfu4kRGOLbjv3cvINx3quPeocYmTgYDzFKcDArifD2
 q4cmCfGmJFZWpRblxxeV5qQWH2I0BbpvIrOUaHI+MMrySuINzQxMDU3MLA1MLc2MlcR5PQs6
 EoUE0hNLUrNTUwtSi2D6mDg4pRqYCrMeveI74t0+o0jsu3ir1/4vh6JW1ttucozsXqEx9aKa
 zI3iuy/ZrnFM2/j3x61Y92C3EmNJ46A7u8VWf/+1XM/tyH1jod4DZ/4kvRB0KeLZWXb5Mc/y
 25p+rHmfo9Ya79P8Pqk7W9Lxp6S0p1rsCybFueZaXQtl7a7duHR5i/XPk3Jr+/RFXJ6ltMg9
 2L1NceLH5E2vgkWmuxwS8s/eWWpr1Leo89R5QTv7/8vVGnlT43zNwjnOTLq1LfJ9WLXcvQ8O
 9w2vbK0qZor8b17dvGPJl5CvOwIPJUbODi6xO3Lz5IHJXw77RuSVcJQ8rebZuizu4SmDAz/W
 194Tn8ffsDrQ72pNmBnHrGWPN031VWIpzkg01GIuKk4EAEELHGP6AgAA
X-CMS-MailID: 20220413122941eucas1p1ec05e8e8dfe2baf451fcb549d60fda35
X-Msg-Generator: CA
X-RootMTR: 20220413122941eucas1p1ec05e8e8dfe2baf451fcb549d60fda35
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220413122941eucas1p1ec05e8e8dfe2baf451fcb549d60fda35
References: <CGME20220413122941eucas1p1ec05e8e8dfe2baf451fcb549d60fda35@eucas1p1.samsung.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Luis Chamberlain <mcgrof@kernel.org> f2fs currently
 only work with zoned storage devices with a zone size which is a power of
 2 (PO2). So check if a non-power of 2 zoned device is found, and if so disallow
 its use. This prevents users fr [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [210.118.77.12 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [210.118.77.12 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nec88-0000kg-25
Subject: [f2fs-dev] [PATCH v2] libf2fs: don't allow mkfs / fsck on non
 power-of-2 zoned devices
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
Cc: Pankaj Raghav <p.raghav@samsung.com>, Damien.LeMoal@wdc.com,
 pankydev8@gmail.com, mcgrof@kernel.org, javier.gonz@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Luis Chamberlain <mcgrof@kernel.org>

f2fs currently only work with zoned storage devices with a zone
size which is a power of 2 (PO2). So check if a non-power of 2
zoned device is found, and if so disallow its use. This prevents
users from incorrectly using these devices.

This is a non-issue today given today's kernel does not allow NPO2
zoned devices to exist as a block device. But NPO2 zoned devices do exist
so proactively put a stop-gap measure in place to prevent it from being
incorrectly used.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
Changes since v1:
- Squash the commits for clarity (Damien)
- f2fs_get_zone_chunk_sectors can return uint32_t (Damien)
- Include the units for zone size in msg info (Damien)
- Sections can be npo2 but it should only be a multiple of 2MB (Jaegeuk)

 include/f2fs_fs.h   |  1 +
 lib/libf2fs.c       | 17 +++++++++++++++--
 lib/libf2fs_zoned.c | 34 ++++++++++++++++++++++------------
 3 files changed, 38 insertions(+), 14 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index d236437..83c5b33 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -386,6 +386,7 @@ struct device_info {
 	u_int32_t nr_zones;
 	u_int32_t nr_rnd_zones;
 	size_t zone_blocks;
+	uint64_t zone_size;
 	size_t *zone_cap_blocks;
 };
 
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 420dfda..8104667 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -882,6 +882,11 @@ static int open_check_fs(char *path, int flag)
 	return open(path, O_RDONLY | flag);
 }
 
+static int is_power_of_2(unsigned long n)
+{
+	return (n != 0 && ((n & (n - 1)) == 0));
+}
+
 int get_device_info(int i)
 {
 	int32_t fd = 0;
@@ -1043,6 +1048,13 @@ int get_device_info(int i)
 			return -1;
 		}
 
+		if (!is_power_of_2(dev->zone_size)) {
+			MSG(0, "\tError: zoned: illegal zone size %lu (not a power of 2)\n",
+					dev->zone_size);
+			free(stat_buf);
+			return -1;
+		}
+
 		/*
 		 * Check zone configuration: for the first disk of a
 		 * multi-device volume, conventional zones are needed.
@@ -1055,8 +1067,9 @@ int get_device_info(int i)
 		MSG(0, "Info: Host-%s zoned block device:\n",
 				(dev->zoned_model == F2FS_ZONED_HA) ?
 					"aware" : "managed");
-		MSG(0, "      %u zones, %u randomly writeable zones\n",
-				dev->nr_zones, dev->nr_rnd_zones);
+		MSG(0, "      %u zones, %lu zone size(bytes), %u randomly writeable zones\n",
+				dev->nr_zones, dev->zone_size,
+				dev->nr_rnd_zones);
 		MSG(0, "      %lu blocks per zone\n",
 				dev->zone_blocks);
 	}
diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index ce73b9a..48a23c0 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -146,40 +146,50 @@ int f2fs_get_zoned_model(int i)
 	return 0;
 }
 
-int f2fs_get_zone_blocks(int i)
+uint32_t f2fs_get_zone_chunk_sectors(struct device_info *dev)
 {
-	struct device_info *dev = c.devices + i;
-	uint64_t sectors;
+	uint32_t sectors;
 	char str[PATH_MAX];
 	FILE *file;
 	int res;
 
-	/* Get zone size */
-	dev->zone_blocks = 0;
-
 	res = get_sysfs_path(dev, "queue/chunk_sectors", str, sizeof(str));
 	if (res != 0) {
 		MSG(0, "\tError: Failed to get device sysfs attribute path\n");
-		return -1;
+		return 0;
 	}
 
 	file = fopen(str, "r");
 	if (!file)
-		return -1;
+		return 0;
 
 	memset(str, 0, sizeof(str));
 	res = fscanf(file, "%s", str);
 	fclose(file);
 
 	if (res != 1)
-		return -1;
+		return 0;
 
-	sectors = atol(str);
+	sectors = atoi(str);
+
+	return sectors;
+}
+
+int f2fs_get_zone_blocks(int i)
+{
+	struct device_info *dev = c.devices + i;
+	uint64_t sectors;
+
+	/* Get zone size */
+	dev->zone_blocks = 0;
+
+	sectors = f2fs_get_zone_chunk_sectors(dev);
 	if (!sectors)
 		return -1;
 
-	dev->zone_blocks = sectors >> (F2FS_BLKSIZE_BITS - 9);
-	sectors = (sectors << 9) / c.sector_size;
+	dev->zone_size = sectors << SECTOR_SHIFT;
+	dev->zone_blocks = sectors >> (F2FS_BLKSIZE_BITS - SECTOR_SHIFT);
+	sectors = dev->zone_size / c.sector_size;
 
 	/*
 	 * Total number of zones: there may
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
