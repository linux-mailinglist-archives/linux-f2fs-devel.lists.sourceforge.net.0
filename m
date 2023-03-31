Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9AA6D1CC5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 31 Mar 2023 11:42:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1piBHK-0002wr-Se;
	Fri, 31 Mar 2023 09:42:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.ye@mediatek.com>) id 1piBHH-0002wl-Jd
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Mar 2023 09:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=woMdJmPGwqbmkNZP2IiNYeJBaZIPhitmDLlx3uTqBlE=; b=expHQRFaMOd37g26jmzk1EB0KF
 /cajvKITbKkxeaLYLpWrLEjFXv2UzwPs5GFKY/h/xdMSxF6wLFL9ZXO1UyZ9tO41VPSzXQOIh4P6y
 EffHhX1wIeWgWUDsPN2m6p1kNvk9Tc+/PRQOqmbCSrQ+JNDesGUwS2IiYEKcDSa6zOuA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=woMdJmPGwqbmkNZP2IiNYeJBaZIPhitmDLlx3uTqBlE=; b=FkZL0phwXcSztFysDZOxFw1wQG
 aOzJ8EM7/SJkwCNcqzPLd/NJ745wHQx4ckEP1ZCSDed3IuWm5010aY159vEoRUv9qTg94FHh+gyyl
 IEvL79v8/aA8c+aSxeLC7za2368rcvcqzydEtJQNl+Zo9ZEJe6PmqsjVLlroMgvDnxv4=;
Received: from [210.61.82.184] (helo=mailgw02.mediatek.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1piBHC-00Aj7N-Pp for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Mar 2023 09:42:34 +0000
X-UUID: 394a635ecfa611edb6b9f13eb10bd0fe-20230331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=woMdJmPGwqbmkNZP2IiNYeJBaZIPhitmDLlx3uTqBlE=; 
 b=aJ1B8PIFPT6L2CEJH+H2McTj79ic49HEN9zKuRjrEWEW2TulJC/MhTfzn+hSoARpY7l9/odJbik1jr68/Fc9DACsaUnp+FEHbNP0CmHXqOdF6a2hVyTxdm+WlbagcJCaSejPY5CSlRCmqSH3SgNlzeI0eA1WL3tieFYq8dsvZLE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:cabbaf4d-e56f-428d-88a6-ed4944ada1e1, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.22, REQID:cabbaf4d-e56f-428d-88a6-ed4944ada1e1, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:120426c, CLOUDID:4cd2152a-564d-42d9-9875-7c868ee415ec,
 B
 ulkID:230331172717Z0H6RC8V,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
 C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
 L:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 394a635ecfa611edb6b9f13eb10bd0fe-20230331
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <bo.ye@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1312685728; Fri, 31 Mar 2023 17:27:15 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 31 Mar 2023 17:27:13 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 31 Mar 2023 17:27:12 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, xiongping1
 <xiongping1@xiaomi.com>, qixiaoyu1 <qixiaoyu1@xiaomi.com>
Date: Fri, 31 Mar 2023 17:26:57 +0800
Message-ID: <20230331092658.72386-2-bo.ye@mediatek.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20230331092658.72386-1-bo.ye@mediatek.com>
References: <20230331092658.72386-1-bo.ye@mediatek.com>
MIME-Version: 1.0
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Qilin Tan <qilin.tan@mediatek.com> Need add __pack for
 struct extent_info to align to memory layout of struct rb_entry. struct
 rb_entry
 { struct rb_node rb_node; /* rb node located in rb-tree */ union { struct
 { unsigned int ofs; /* start offset of the entry */ unsigned int len; /*
 length of the entry */ }; unsigned lo [...] 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [210.61.82.184 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
X-Headers-End: 1piBHC-00Aj7N-Pp
Subject: [f2fs-dev] [PATCH 2/2] f2fs: add __pack attribute for extent_info
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
From: Bo Ye via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Bo Ye <bo.ye@mediatek.com>
Cc: Qilin Tan <qilin.tan@mediatek.com>, yongdong.zhang@mediatek.com,
 linux-kernel@vger.kernel.org, light.hsieh@mediatek.com,
 linux-f2fs-devel@lists.sourceforge.net, Bo Ye <bo.ye@mediatek.com>,
 linux-mediatek@lists.infradead.org, browse.zhang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, peng.zhou@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Qilin Tan <qilin.tan@mediatek.com>

Need add __pack for struct extent_info to align to memory
layout of struct rb_entry.

struct rb_entry {
    struct rb_node rb_node;     /* rb node located in rb-tree */
    union {
        struct {
            unsigned int ofs;   /* start offset of the entry */
            unsigned int len;   /* length of the entry */
        };
        unsigned long long key;     /* 64-bits key */
    } __packed;
};

struct extent_info {
    unsigned int fofs;      /* start offset in a file */
    unsigned int len;       /* length of the extent */
    union {
        ...
        /* block age extent_cache */
        struct {
            /* block age of the extent */
            unsigned long long age;
            /* last total blocks allocated */
            unsigned long long last_blocks;
        };
};

The new fields(age, last_blocks) are u64 in change 71644dff4811, it
cause the memory alignment based on 8 bytes in some complier. So the
field fofs and len are alloced with 8 bytes and using the last 4 byts.
Its memory is not aligned with struct rb_entry. the ofs of rb_entry
pointer to a invalid value and cause writing file failed.

struct extent_info's offset should be 12 rather than 16 from the
beginning of struct rb_entry.

The offset dump for the bad case as:
kworker/u16:6: [name:f2fs&]f2fs_lookup_rb_tree_for_insert:MTK_DEBUG: ino=1629 re=0xc675dc08 ofs=0 re->ofs=0, re->len=68 ei=0xc675dc18 ei.fofs=68 ei.len=277

Fixes: 71644dff4811 ("f2fs: add block_age-based extent cache")
Signed-off-by: Bo Ye <bo.ye@mediatek.com>
Signed-off-by: Qilin Tan <qilin.tan@mediatek.com>
---
 fs/f2fs/f2fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b0ab2062038a..7c690667a42f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -660,7 +660,7 @@ struct extent_info {
 			unsigned long long last_blocks;
 		};
 	};
-};
+} __packed;
 
 struct extent_node {
 	struct rb_node rb_node;		/* rb node located in rb-tree */
-- 
2.17.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
