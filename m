Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM7fGpGJn2mmcgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 00:45:21 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7865119EFF4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 00:45:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:In-Reply-To:References:Message-Id:MIME-Version:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LoJOni4MFiUIykl7M6H57BCCOX446OwmNOuuk8iu1lw=; b=DP6upoE9Wl1qPk4S4Eim5GG+hR
	piIto7Tw/uvxem0GD4S3yl8SMp9doruQBqNmEN5o8bO/ryFrN9JlfHLOJYXBRVmDPoGiO/eMGIV3Q
	OrNXcmZd2CFg0FjXRZCT2iUo+n82s9XtqEGDNKKYmuhbHfFgrBbW95PFfHGdNO45TL58=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvOZ6-0001yl-5t;
	Wed, 25 Feb 2026 23:45:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tz2294@columbia.edu>) id 1vvOZ0-0001yC-1E
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Feb 2026 23:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aPwSt3hNTFLah6XnifhLIiPsp4G0eC4H6I7+g5VD+/A=; b=HG7doQ2i9/LkLw74YYP0CquFaV
 kCQiU2Bs9Ez2b+4W6PuNhxfLtLLXyuSlHgnS6kwZKxZl5WN25yP8VyLFeTzuUZQvuUM3P6J/sj+Xi
 ahBjCbczgtRCfhd2DH2RY7w+P4k/7vukIvT30FZHktNQncFqrmmT4+83O7CK7w3aEMPU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aPwSt3hNTFLah6XnifhLIiPsp4G0eC4H6I7+g5VD+/A=; b=I6nYCDLubSSIuZ4MM5UV5AF8xu
 C7dGS3kjItY232LzMWa/p10U++JKSB1nI1wYnQ+hXsc92gDyCcwBICOC8rwFMtGrO0hzkOjd5OiyB
 QLyENAPSdiSRPLRWmgJtXvq/+jji3Z0Fk/jCAPLPJTqiOGNriprLsSmTGUJyUfYaY4L4=;
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvOYt-00017c-PW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Feb 2026 23:45:00 +0000
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
 by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61PNNAHE1444730
 for <linux-f2fs-devel@lists.sourceforge.net>; Wed, 25 Feb 2026 18:44:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pps01; bh=aPwS
 t3hNTFLah6XnifhLIiPsp4G0eC4H6I7+g5VD+/A=; b=KoW+DwoaLBgIKKp07zkU
 w6LYikbpCWQdrh8W1nzdyxYpkzLEcclQRcT7hkkJaTTe33MpHaIr+E7mV91Tq/bL
 SSiXdSa+Gguo6I/AW/mctmElGMAmkjDC+H2jI36BoHDA7GKVhEHL7OJPnGLlvEtT
 4BTdKWrcZuavMXt9r5oc/wjjaziypL86FswUmtKMi7y6Z6HU9iS0yuI9a8I+b0P6
 C+9RwDMULkiKD/iD9k3Sj1JnVFSLbkH0d37CIXOpEzab4zAj7ZLAs5c42CcZAvY/
 y6VP7ocVtll9BIBDwonFGbm0jimM+NTHDOvcuRroLMGuOZKT2Zb5ZQ5D6pO86jQn
 BQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4cj116drch-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Feb 2026 18:44:48 -0500 (EST)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c70d16d5a9so119222685a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Feb 2026 15:44:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772063088; x=1772667888;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aPwSt3hNTFLah6XnifhLIiPsp4G0eC4H6I7+g5VD+/A=;
 b=n33zlNIg8yDNtXU6XFyUeqfeo5qLjgUxfGvve03qlxQLTLMQw+08jg+zOdbuoufNMr
 K60f1XJ9y2v0xluvItrCJSagrP3E6jaGb32tPLU5yMw8IVY31DBC3YGoI+S83W33YME0
 MWXj0A4ahcgOSJJaRkAujsbrm6ZC1wzoKBgMRwmYoQUpF7UChUL5zj87+lGGs8uQCY5O
 L42Rfi8kpG36mDUF2elTgLrASaLqBbQtg0czx8atwsvKUPgTpdKbsxwVGSiUIARo5zba
 simT+KLeGzfoShywjLgPj9fSZM7aHyvNe1SqvWl1VcSpcobvlyLHoT1sqZQciHXR57JN
 0a2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV62dEh4qIF+It9SccHOzc7IWk6m9KwhdP97zHuPe1LTA4C0oyU8TiNX5oZurz/+yipVPrmLa9dO/WjJoE3d5KI@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzI8m0QvbHatHhgEXWKyW2hJSQLTnXqw8sB//TH/SFdlIqSPSGy
 yA9HxGKKwrRWEblvT8dbCSLK77HAO6Gz4keaum9fhpgUlap5Jq2EULf0X5nFqx05uoxc0Y6y8GQ
 46ukYVPY9aNnMoOI6nqRct1AyLyW/fU9orVTp45cE5Ec7khbWDHjMaD1P8YIjWQa5BXPCwEGtFi
 g=
X-Gm-Gg: ATEYQzy3voDiW06QiWIwp3az31hsHnk66P3yeWEmu66/iLuFLR3CNcHtkBVwK1p06Tr
 KWQu75k+FxvAs4njLk9LYFggo2Z1iblLgilBHml7baMkkY0LeuM4WRkh9NMt7xeuLqc/JZZE1Qz
 qK0gQwqVxsmsZpmkdOxw9F4ifiwFO+n9jY9OpuNQ26QWdji5lEWeK+MEzsHp6SYvxKhoXlqY+MO
 8nycf6d/3zsoTfjIjJzZK0TOMsjH7hzeHVd5omz4nQQBY0Vu7qiJrdjN8GdpDyW4rknwrO7VhEM
 SULUlZVVhzovD4ciF42Hyt6yz0bnwr32ha3XruQ45dlnjmlFNkkBNG+Y8e8YxOo26E9QfQ5TwuM
 ToLicNvKPnN97vicZzmtFG5OBY0FUUFu+
X-Received: by 2002:a05:620a:298c:b0:8ca:d5cb:6844 with SMTP id
 af79cd13be357-8cbbcff7196mr323695585a.49.1772063087717; 
 Wed, 25 Feb 2026 15:44:47 -0800 (PST)
X-Received: by 2002:a05:620a:298c:b0:8ca:d5cb:6844 with SMTP id
 af79cd13be357-8cbbcff7196mr323686785a.49.1772063086986; 
 Wed, 25 Feb 2026 15:44:46 -0800 (PST)
Received: from [127.0.1.1] ([216.158.158.246])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-899c738d80bsm3357606d6.41.2026.02.25.15.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 15:44:46 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 25 Feb 2026 18:44:27 -0500
MIME-Version: 1.0
Message-Id: <20260225-pagevec_cleanup-v2-3-716868cc2d11@columbia.edu>
References: <20260225-pagevec_cleanup-v2-0-716868cc2d11@columbia.edu>
In-Reply-To: <20260225-pagevec_cleanup-v2-0-716868cc2d11@columbia.edu>
To: David Howells <dhowells@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 Dan Williams <dan.j.williams@intel.com>, Jan Kara <jack@suse.cz>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772063077; l=17408;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=89ejBUbJAbl9gMJxu0YjzDjYEINzrXDJ4zlC90ZjW70=;
 b=DZR7t8/xTD2RV8IcGDVSrVRbyHqSjvi+mmPKtQKoMAq7YXgwLRBOLtA12ryjIBbsZ8xRvPgOR
 iq+s155nXzBDa4/nkNXPNn2pWi+s7DCbvZYs9/y3NwEhX5dVRbKSlDM
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDIyNyBTYWx0ZWRfX++Rgn4rmuqrp
 pxzcQc1mor3D5hNCR1s1kWOmw7kqb5M0nV8pBfnwNoqDVOfi347XvpTCsmlxwV7V1pbPF1it+fc
 B00yO4evZocJcoCdsHLXTkXqC1JUSBR1K8JmV7vh7KVp/hT1/OsRbJ9jbfhwwuUNFij5ncTK/WC
 U022nWrL1irpuyZNAwrlkk4JZiPH7pFMdnSYa0TA6pVRhC5zpl9SWzXGwTYMXLOPQKcD7y2o5FC
 wfg1kI0FSIV0hWKyX17SezkwH2hjcYAG+9VXyXicN1zp1SOAtVG5nc5wPfY1d0y13OW2uvz1LfD
 QmpsmaxClrNTJfjE15OPfEiVld9c+ob2P+os2tJHcaUQ2bUszIO/dNCejJ77OTWiskSu4GOBTc1
 D9TMnFD1tSpobz6vHKYffH1AevUs5vzExucoLpQh3QwspyTlAO/0j8YT/v5TtqzDecao37t3YBD
 v+9QcDBAv+LkS2jJn/g==
X-Authority-Analysis: v=2.4 cv=cYjfb3DM c=1 sm=1 tr=0 ts=699f8971 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=mD05b5UW6KhLIDvowZ5dSQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=x7bEGLp0ZPQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=1-S1nHsFAAAA:8 a=37rDS-QxAAAA:8 a=VwQbUJbxAAAA:8 a=_gStYsYcyfV-qr5JuIkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=gK44uIRsrOYWoX5St5dO:22 a=k1Nq6YrhK2t884LQW06G:22
X-Proofpoint-GUID: 5J7xPNvNDjM3eGypyTSsi-cNXCCzZHYk
X-Proofpoint-ORIG-GUID: 5J7xPNvNDjM3eGypyTSsi-cNXCCzZHYk
X-Proofpoint-Virus-Version: vendor=nai engine=6800 definitions=11712
 signatures=596818
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=10
 impostorscore=10 adultscore=0 bulkscore=10 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250227
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: struct pagevec was removed in commit 1e0877d58b1e ("mm:
 remove
 struct pagevec"). Rename include/linux/pagevec.h to reflect reality and update
 includes tree-wide. Add the new filename to MAINTAINERS ex [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1vvOYt-00017c-PW
Subject: [f2fs-dev] [PATCH v2 3/4] folio_batch: Rename pagevec.h to
 folio_batch.h
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
Cc: nvdimm@lists.linux.dev, Tal Zussman <tz2294@columbia.edu>,
 Paulo Alcantara <pc@manguebit.org>, Alex Markuze <amarkuze@redhat.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Peter Xu <peterx@redhat.com>, Yuanchu Xie <yuanchu@google.com>,
 linux-mm@kvack.org, Chris Mason <clm@fb.com>, Hugh Dickins <hughd@google.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Pedro Falcato <pfalcato@suse.de>,
 samba-technical@lists.samba.org, linux-xfs@vger.kernel.org,
 David Airlie <airlied@gmail.com>, linux-afs@lists.infradead.org,
 Simona Vetter <simona@ffwll.ch>, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Mark Fasheh <mark@fasheh.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, Dai Ngo <Dai.Ngo@oracle.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Jason Gunthorpe <jgg@ziepe.ca>,
 Viacheslav Dubeyko <slava@dubeyko.com>, Zi Yan <ziy@nvidia.com>,
 NeilBrown <neil@brown.name>, Axel Rasmussen <axelrasmussen@google.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Wei Xu <weixugc@google.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, Anna Schumaker <anna@kernel.org>,
 Jann Horn <jannh@google.com>, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, cgroups@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Tom Talpey <tom@talpey.com>,
 ocfs2-devel@lists.linux.dev, Bharath SM <bharathsm@microsoft.com>,
 Joel Becker <jlbec@evilplan.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Sterba <dsterba@suse.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, ceph-devel@vger.kernel.org,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Jani Nikula <jani.nikula@linux.intel.com>,
 gfs2@lists.linux.dev, linux-nfs@vger.kernel.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 Muchun Song <muchun.song@linux.dev>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 linux-btrfs@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, Brendan Jackman <jackmanb@google.com>,
 Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[columbia.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,auristor.com,kernel.org,linux-foundation.org,oracle.com,google.com,suse.com,tencent.com,huaweicloud.com,gmail.com,infradead.org,intel.com,suse.cz,zeniv.linux.org.uk,mit.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tz2294@columbia.edu,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dhowells@redhat.com,m:marc.dionne@auristor.com,m:jaegeuk@kernel.org,m:chao@kernel.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:baohua@kernel.org,m:willy@infradead.org,m:dan.j.williams@intel.com,m:jack@suse.cz,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:tytso@mit.edu,m:nvdimm@lists.linux.dev,m:tz2294@columbia.edu,m:pc@manguebit.org,m:amarkuze@redhat.com,m:djwong@kernel.org,m:joonas.lahtinen@linux.intel.com,m:peterx@redhat.com,m:yuanchu@google.com,m:linux-mm@kvack.org,m:clm@fb.com,m:hughd@google.com,m:adilger.kernel@dilger.ca,m:pfalcato@suse.de,m:samba-technical@lists.samba.org,m:linux-xfs@vger.kernel.org,m:airlied@gmail.com,m:linux-afs@lists.infradead.org,m:simona@ffwll.ch,m:linux-cifs@vger.kernel.org,m:linux-nil
 fs@vger.kernel.org,m:agruenba@redhat.com,m:mark@fasheh.com,m:zhengqi.arch@bytedance.com,m:roman.gushchin@linux.dev,m:Dai.Ngo@oracle.com,m:tursulin@ursulin.net,m:jgg@ziepe.ca,m:slava@dubeyko.com,m:ziy@nvidia.com,m:neil@brown.name,m:axelrasmussen@google.com,m:idryomov@gmail.com,m:linux-ext4@vger.kernel.org,m:weixugc@google.com,m:sprasad@microsoft.com,m:okorniev@redhat.com,m:anna@kernel.org,m:jannh@google.com,m:jhubbard@nvidia.com,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:cgroups@vger.kernel.org,m:mripard@kernel.org,m:tom@talpey.com,m:ocfs2-devel@lists.linux.dev,m:bharathsm@microsoft.com,m:jlbec@evilplan.org,m:ronniesahlberg@gmail.com,m:rodrigo.vivi@intel.com,m:dsterba@suse.com,m:shakeel.butt@linux.dev,m:ceph-devel@vger.kernel.org,m:konishi.ryusuke@gmail.com,m:osalvador@suse.de,m:jani.nikula@linux.intel.com,m:gfs2@lists.linux.dev,m:linux-nfs@vger.kernel.org,m:baolin.wang@linux.alibaba.com,m:joseph.qi@linux.alibaba.com,m:dri-devel@lists.freedesktop.org,m:mu
 chun.song@linux.dev,m:jlayton@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:chuck.lever@oracle.com,m:linux-btrfs@vger.kernel.org,m:tzimmermann@suse.de,m:hannes@cmpxchg.org,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:jackmanb@google.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,columbia.edu:s=pps01];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,columbia.edu:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[columbia.edu:mid,columbia.edu:email,kvack.org:email];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCPT_COUNT_GT_50(0.00)[97];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tz2294@columbia.edu,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[lists.linux.dev,columbia.edu,manguebit.org,redhat.com,kernel.org,linux.intel.com,google.com,kvack.org,fb.com,dilger.ca,suse.de,lists.samba.org,vger.kernel.org,gmail.com,lists.infradead.org,ffwll.ch,fasheh.com,bytedance.com,linux.dev,oracle.com,ursulin.net,ziepe.ca,dubeyko.com,nvidia.com,brown.name,microsoft.com,lists.freedesktop.org,talpey.com,evilplan.org,intel.com,suse.com,linux.alibaba.com,lists.sourceforge.net,samba.org,cmpxchg.org];
	NEURAL_HAM(-0.00)[-0.963];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7865119EFF4
X-Rspamd-Action: no action

c3RydWN0IHBhZ2V2ZWMgd2FzIHJlbW92ZWQgaW4gY29tbWl0IDFlMDg3N2Q1OGIxZSAoIm1tOiBy
ZW1vdmUgc3RydWN0CnBhZ2V2ZWMiKS4gUmVuYW1lIGluY2x1ZGUvbGludXgvcGFnZXZlYy5oIHRv
IHJlZmxlY3QgcmVhbGl0eSBhbmQgdXBkYXRlCmluY2x1ZGVzIHRyZWUtd2lkZS4gQWRkIHRoZSBu
ZXcgZmlsZW5hbWUgdG8gTUFJTlRBSU5FUlMgZXhwbGljaXRseSwgYXMKaXQgbm8gbG9uZ2VyIG1h
dGNoZXMgdGhlICJpbmNsdWRlL2xpbnV4L3BhZ2VbLV9dKiIgcGF0dGVybiBpbiBNRU1PUlkKTUFO
QUdFTUVOVCAtIENPUkUuCgpTaWduZWQtb2ZmLWJ5OiBUYWwgWnVzc21hbiA8dHoyMjk0QGNvbHVt
YmlhLmVkdT4KLS0tCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAxICsKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgICAgICAgICAgICAgICAgICB8IDIgKy0K
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zaG1lbS5jICB8IDIgKy0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0dC5oICAgICAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfZ3B1X2Vycm9yLmMgICAgICB8IDIgKy0KIGZzL2J0cmZzL2NvbXByZXNz
aW9uLmMgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGZzL2J0cmZzL2V4dGVudF9pby5jICAg
ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGZzL2J0cmZzL3Rlc3RzL2V4dGVudC1pby10ZXN0
cy5jICAgICAgICAgICB8IDIgKy0KIGZzL2J1ZmZlci5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDIgKy0KIGZzL2NlcGgvYWRkci5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDIgKy0KIGZzL2V4dDQvaW5vZGUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIg
Ky0KIGZzL2YyZnMvY2hlY2twb2ludC5jICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGZz
L2YyZnMvY29tcHJlc3MuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGZzL2YyZnMv
ZGF0YS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGZzL2YyZnMvbm9kZS5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGZzL2dmczIvYW9wcy5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGZzL2h1Z2V0bGJmcy9pbm9kZS5jICAgICAg
ICAgICAgICAgICAgICAgICB8IDIgKy0KIGZzL25pbGZzMi9idHJlZS5jICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDIgKy0KIGZzL25pbGZzMi9wYWdlLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDIgKy0KIGZzL25pbGZzMi9zZWdtZW50LmMgICAgICAgICAgICAgICAgICAgICAgICB8
IDIgKy0KIGZzL3JhbWZzL2ZpbGUtbm9tbXUuYyAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0K
IGluY2x1ZGUvbGludXgve3BhZ2V2ZWMuaCA9PiBmb2xpb19iYXRjaC5ofSB8IDggKysrKy0tLS0K
IGluY2x1ZGUvbGludXgvZm9saW9fcXVldWUuaCAgICAgICAgICAgICAgICB8IDIgKy0KIGluY2x1
ZGUvbGludXgvaW9tYXAuaCAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGluY2x1ZGUvbGlu
dXgvc3VucnBjL3N2Yy5oICAgICAgICAgICAgICAgICB8IDIgKy0KIGluY2x1ZGUvbGludXgvd3Jp
dGViYWNrLmggICAgICAgICAgICAgICAgICB8IDIgKy0KIG1tL2ZpbGVtYXAuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIG1tL2d1cC5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDIgKy0KIG1tL21lbWNvbnRyb2wuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDIgKy0KIG1tL21sb2NrLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDIgKy0KIG1tL3BhZ2Utd3JpdGViYWNrLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDIg
Ky0KIG1tL3BhZ2VfYWxsb2MuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIG1t
L3NobWVtLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIG1tL3N3YXAu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIG1tL3N3YXBfc3RhdGUu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIG1tL3RydW5jYXRlLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIG1tL3Ztc2Nhbi5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDIgKy0KIDM3IGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMo
KyksIDM5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5F
UlMKaW5kZXggZTQ1NzJhMzZhZmQyLi5mNTA0MjFlNjVjYjEgMTAwNjQ0Ci0tLSBhL01BSU5UQUlO
RVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0xNjY2NCw2ICsxNjY2NCw3IEBAIEw6CWxpbnV4LW1t
QGt2YWNrLm9yZwogUzoJTWFpbnRhaW5lZAogVzoJaHR0cDovL3d3dy5saW51eC1tbS5vcmcKIFQ6
CWdpdCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYWtwbS9t
bQorRjoJaW5jbHVkZS9saW51eC9mb2xpb19iYXRjaC5oCiBGOglpbmNsdWRlL2xpbnV4L2dmcC5o
CiBGOglpbmNsdWRlL2xpbnV4L2dmcF90eXBlcy5oCiBGOglpbmNsdWRlL2xpbnV4L2hpZ2htZW0u
aApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZ2VtLmMKaW5kZXggODkxYzNiZmY1YWUwLi5kYzQ1MzRmYjE3NWMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0u
YwpAQCAtMzgsNyArMzgsNyBAQAogI2luY2x1ZGUgPGxpbnV4L21tYW4uaD4KICNpbmNsdWRlIDxs
aW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9wYWdlbWFwLmg+Ci0jaW5jbHVkZSA8bGlu
dXgvcGFnZXZlYy5oPgorI2luY2x1ZGUgPGxpbnV4L2ZvbGlvX2JhdGNoLmg+CiAjaW5jbHVkZSA8
bGludXgvc2NoZWQvbW0uaD4KICNpbmNsdWRlIDxsaW51eC9zaG1lbV9mcy5oPgogI2luY2x1ZGUg
PGxpbnV4L3NsYWIuaD4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1
X2dlbV9zaG1lbS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3NobWVtLmMK
aW5kZXggYzZjNjRiYTI5YmM0Li4wNzAyNWI1NDdjOTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zaG1lbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2dlbS9pOTE1X2dlbV9zaG1lbS5jCkBAIC0zLDcgKzMsNyBAQAogICogQ29weXJpZ2h0IMKpIDIw
MTQtMjAxNiBJbnRlbCBDb3Jwb3JhdGlvbgogICovCiAKLSNpbmNsdWRlIDxsaW51eC9wYWdldmVj
Lmg+CisjaW5jbHVkZSA8bGludXgvZm9saW9fYmF0Y2guaD4KICNpbmNsdWRlIDxsaW51eC9zaG1l
bV9mcy5oPgogI2luY2x1ZGUgPGxpbnV4L3N3YXAuaD4KICNpbmNsdWRlIDxsaW51eC91aW8uaD4K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0dC5oIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3R0LmgKaW5kZXggOWQzYTNhZDU2N2EwLi5iNTRlZTRm
MjVhZjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0dC5oCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0dC5oCkBAIC0xOSw3ICsxOSw3IEBA
CiAjaW5jbHVkZSA8bGludXgvaW8tbWFwcGluZy5oPgogI2luY2x1ZGUgPGxpbnV4L2tyZWYuaD4K
ICNpbmNsdWRlIDxsaW51eC9tbS5oPgotI2luY2x1ZGUgPGxpbnV4L3BhZ2V2ZWMuaD4KKyNpbmNs
dWRlIDxsaW51eC9mb2xpb19iYXRjaC5oPgogI2luY2x1ZGUgPGxpbnV4L3NjYXR0ZXJsaXN0Lmg+
CiAjaW5jbHVkZSA8bGludXgvd29ya3F1ZXVlLmg+CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfZ3B1X2Vycm9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dw
dV9lcnJvci5jCmluZGV4IGE5OWI0ZTQ1ZDI2Yy4uZmZlNWYyNDU5NGM5IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dwdV9lcnJvci5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2k5MTVfZ3B1X2Vycm9yLmMKQEAgLTMxLDcgKzMxLDcgQEAKICNpbmNsdWRlIDxsaW51
eC9kZWJ1Z2ZzLmg+CiAjaW5jbHVkZSA8bGludXgvaGlnaG1lbS5oPgogI2luY2x1ZGUgPGxpbnV4
L25taS5oPgotI2luY2x1ZGUgPGxpbnV4L3BhZ2V2ZWMuaD4KKyNpbmNsdWRlIDxsaW51eC9mb2xp
b19iYXRjaC5oPgogI2luY2x1ZGUgPGxpbnV4L3NjYXR0ZXJsaXN0Lmg+CiAjaW5jbHVkZSA8bGlu
dXgvc3RyaW5nX2hlbHBlcnMuaD4KICNpbmNsdWRlIDxsaW51eC91dHNuYW1lLmg+CmRpZmYgLS1n
aXQgYS9mcy9idHJmcy9jb21wcmVzc2lvbi5jIGIvZnMvYnRyZnMvY29tcHJlc3Npb24uYwppbmRl
eCA3OTA1MThhOGM4MDMuLmRiYzYzNGQxMGFkMyAxMDA2NDQKLS0tIGEvZnMvYnRyZnMvY29tcHJl
c3Npb24uYworKysgYi9mcy9idHJmcy9jb21wcmVzc2lvbi5jCkBAIC04LDcgKzgsNyBAQAogI2lu
Y2x1ZGUgPGxpbnV4L2ZpbGUuaD4KICNpbmNsdWRlIDxsaW51eC9mcy5oPgogI2luY2x1ZGUgPGxp
bnV4L3BhZ2VtYXAuaD4KLSNpbmNsdWRlIDxsaW51eC9wYWdldmVjLmg+CisjaW5jbHVkZSA8bGlu
dXgvZm9saW9fYmF0Y2guaD4KICNpbmNsdWRlIDxsaW51eC9oaWdobWVtLmg+CiAjaW5jbHVkZSA8
bGludXgva3RocmVhZC5oPgogI2luY2x1ZGUgPGxpbnV4L3RpbWUuaD4KZGlmZiAtLWdpdCBhL2Zz
L2J0cmZzL2V4dGVudF9pby5jIGIvZnMvYnRyZnMvZXh0ZW50X2lvLmMKaW5kZXggNzQ0YTFmZmY2
ZWVmLi5jMzczZDExM2YxZTcgMTAwNjQ0Ci0tLSBhL2ZzL2J0cmZzL2V4dGVudF9pby5jCisrKyBi
L2ZzL2J0cmZzL2V4dGVudF9pby5jCkBAIC0xMSw3ICsxMSw3IEBACiAjaW5jbHVkZSA8bGludXgv
YmxrZGV2Lmg+CiAjaW5jbHVkZSA8bGludXgvc3dhcC5oPgogI2luY2x1ZGUgPGxpbnV4L3dyaXRl
YmFjay5oPgotI2luY2x1ZGUgPGxpbnV4L3BhZ2V2ZWMuaD4KKyNpbmNsdWRlIDxsaW51eC9mb2xp
b19iYXRjaC5oPgogI2luY2x1ZGUgPGxpbnV4L3ByZWZldGNoLmg+CiAjaW5jbHVkZSA8bGludXgv
ZnN2ZXJpdHkuaD4KICNpbmNsdWRlICJleHRlbnRfaW8uaCIKZGlmZiAtLWdpdCBhL2ZzL2J0cmZz
L3Rlc3RzL2V4dGVudC1pby10ZXN0cy5jIGIvZnMvYnRyZnMvdGVzdHMvZXh0ZW50LWlvLXRlc3Rz
LmMKaW5kZXggYTAxODdkNjE2M2RmLi5iMmFhY2Y4NDZjOGIgMTAwNjQ0Ci0tLSBhL2ZzL2J0cmZz
L3Rlc3RzL2V4dGVudC1pby10ZXN0cy5jCisrKyBiL2ZzL2J0cmZzL3Rlc3RzL2V4dGVudC1pby10
ZXN0cy5jCkBAIC00LDcgKzQsNyBAQAogICovCiAKICNpbmNsdWRlIDxsaW51eC9wYWdlbWFwLmg+
Ci0jaW5jbHVkZSA8bGludXgvcGFnZXZlYy5oPgorI2luY2x1ZGUgPGxpbnV4L2ZvbGlvX2JhdGNo
Lmg+CiAjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAj
aW5jbHVkZSA8bGludXgvc2l6ZXMuaD4KZGlmZiAtLWdpdCBhL2ZzL2J1ZmZlci5jIGIvZnMvYnVm
ZmVyLmMKaW5kZXggMjJiNDM2NDJiYTU3Li5mMzEyMjE2MGVlMmQgMTAwNjQ0Ci0tLSBhL2ZzL2J1
ZmZlci5jCisrKyBiL2ZzL2J1ZmZlci5jCkBAIC00NSw3ICs0NSw3IEBACiAjaW5jbHVkZSA8bGlu
dXgvYml0b3BzLmg+CiAjaW5jbHVkZSA8bGludXgvbXBhZ2UuaD4KICNpbmNsdWRlIDxsaW51eC9i
aXRfc3BpbmxvY2suaD4KLSNpbmNsdWRlIDxsaW51eC9wYWdldmVjLmg+CisjaW5jbHVkZSA8bGlu
dXgvZm9saW9fYmF0Y2guaD4KICNpbmNsdWRlIDxsaW51eC9zY2hlZC9tbS5oPgogI2luY2x1ZGUg
PHRyYWNlL2V2ZW50cy9ibG9jay5oPgogI2luY2x1ZGUgPGxpbnV4L2ZzY3J5cHQuaD4KZGlmZiAt
LWdpdCBhL2ZzL2NlcGgvYWRkci5jIGIvZnMvY2VwaC9hZGRyLmMKaW5kZXggZTg3YjNiYjk0ZWU4
Li4yODAzNTExZDg2ZWYgMTAwNjQ0Ci0tLSBhL2ZzL2NlcGgvYWRkci5jCisrKyBiL2ZzL2NlcGgv
YWRkci5jCkBAIC03LDcgKzcsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3N3YXAuaD4KICNpbmNsdWRl
IDxsaW51eC9wYWdlbWFwLmg+CiAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgotI2luY2x1ZGUgPGxp
bnV4L3BhZ2V2ZWMuaD4KKyNpbmNsdWRlIDxsaW51eC9mb2xpb19iYXRjaC5oPgogI2luY2x1ZGUg
PGxpbnV4L3Rhc2tfaW9fYWNjb3VudGluZ19vcHMuaD4KICNpbmNsdWRlIDxsaW51eC9zaWduYWwu
aD4KICNpbmNsdWRlIDxsaW51eC9pdmVyc2lvbi5oPgpkaWZmIC0tZ2l0IGEvZnMvZXh0NC9pbm9k
ZS5jIGIvZnMvZXh0NC9pbm9kZS5jCmluZGV4IDM5NmRjM2E1ZDE2Yi4uNThmOTgyODg1MTg3IDEw
MDY0NAotLS0gYS9mcy9leHQ0L2lub2RlLmMKKysrIGIvZnMvZXh0NC9pbm9kZS5jCkBAIC0yOSw3
ICsyOSw3IEBACiAjaW5jbHVkZSA8bGludXgvc3RyaW5nLmg+CiAjaW5jbHVkZSA8bGludXgvYnVm
ZmVyX2hlYWQuaD4KICNpbmNsdWRlIDxsaW51eC93cml0ZWJhY2suaD4KLSNpbmNsdWRlIDxsaW51
eC9wYWdldmVjLmg+CisjaW5jbHVkZSA8bGludXgvZm9saW9fYmF0Y2guaD4KICNpbmNsdWRlIDxs
aW51eC9tcGFnZS5oPgogI2luY2x1ZGUgPGxpbnV4L3JtYXAuaD4KICNpbmNsdWRlIDxsaW51eC9u
YW1laS5oPgpkaWZmIC0tZ2l0IGEvZnMvZjJmcy9jaGVja3BvaW50LmMgYi9mcy9mMmZzL2NoZWNr
cG9pbnQuYwppbmRleCA2ZGQzOWI3ZGUxMWEuLjAxNDMzNjVjMDdkYyAxMDA2NDQKLS0tIGEvZnMv
ZjJmcy9jaGVja3BvaW50LmMKKysrIGIvZnMvZjJmcy9jaGVja3BvaW50LmMKQEAgLTExLDcgKzEx
LDcgQEAKICNpbmNsdWRlIDxsaW51eC93cml0ZWJhY2suaD4KICNpbmNsdWRlIDxsaW51eC9ibGtk
ZXYuaD4KICNpbmNsdWRlIDxsaW51eC9mMmZzX2ZzLmg+Ci0jaW5jbHVkZSA8bGludXgvcGFnZXZl
Yy5oPgorI2luY2x1ZGUgPGxpbnV4L2ZvbGlvX2JhdGNoLmg+CiAjaW5jbHVkZSA8bGludXgvc3dh
cC5oPgogI2luY2x1ZGUgPGxpbnV4L2t0aHJlYWQuaD4KICNpbmNsdWRlIDxsaW51eC9kZWxheWFj
Y3QuaD4KZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY29tcHJlc3MuYyBiL2ZzL2YyZnMvY29tcHJlc3Mu
YwppbmRleCA4Yzc2NDAwYmE2MzEuLjYxNGUwMGI4ZmZkYyAxMDA2NDQKLS0tIGEvZnMvZjJmcy9j
b21wcmVzcy5jCisrKyBiL2ZzL2YyZnMvY29tcHJlc3MuYwpAQCAtMTMsNyArMTMsNyBAQAogI2lu
Y2x1ZGUgPGxpbnV4L2x6by5oPgogI2luY2x1ZGUgPGxpbnV4L2x6NC5oPgogI2luY2x1ZGUgPGxp
bnV4L3pzdGQuaD4KLSNpbmNsdWRlIDxsaW51eC9wYWdldmVjLmg+CisjaW5jbHVkZSA8bGludXgv
Zm9saW9fYmF0Y2guaD4KIAogI2luY2x1ZGUgImYyZnMuaCIKICNpbmNsdWRlICJub2RlLmgiCmRp
ZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCmluZGV4IDMzOGRmN2Ey
YWVhNi4uOTBlOGVmNjI1ZDgyIDEwMDY0NAotLS0gYS9mcy9mMmZzL2RhdGEuYworKysgYi9mcy9m
MmZzL2RhdGEuYwpAQCAtMTAsNyArMTAsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3NjaGVkL21tLmg+
CiAjaW5jbHVkZSA8bGludXgvbXBhZ2UuaD4KICNpbmNsdWRlIDxsaW51eC93cml0ZWJhY2suaD4K
LSNpbmNsdWRlIDxsaW51eC9wYWdldmVjLmg+CisjaW5jbHVkZSA8bGludXgvZm9saW9fYmF0Y2gu
aD4KICNpbmNsdWRlIDxsaW51eC9ibGtkZXYuaD4KICNpbmNsdWRlIDxsaW51eC9iaW8uaD4KICNp
bmNsdWRlIDxsaW51eC9ibGstY3J5cHRvLmg+CmRpZmYgLS1naXQgYS9mcy9mMmZzL25vZGUuYyBi
L2ZzL2YyZnMvbm9kZS5jCmluZGV4IDc0OTkyZmQ5YzliNi4uYmEwMjcyMzE0NTI4IDEwMDY0NAot
LS0gYS9mcy9mMmZzL25vZGUuYworKysgYi9mcy9mMmZzL25vZGUuYwpAQCAtMTAsNyArMTAsNyBA
QAogI2luY2x1ZGUgPGxpbnV4L21wYWdlLmg+CiAjaW5jbHVkZSA8bGludXgvc2NoZWQvbW0uaD4K
ICNpbmNsdWRlIDxsaW51eC9ibGtkZXYuaD4KLSNpbmNsdWRlIDxsaW51eC9wYWdldmVjLmg+Cisj
aW5jbHVkZSA8bGludXgvZm9saW9fYmF0Y2guaD4KICNpbmNsdWRlIDxsaW51eC9zd2FwLmg+CiAK
ICNpbmNsdWRlICJmMmZzLmgiCmRpZmYgLS1naXQgYS9mcy9nZnMyL2FvcHMuYyBiL2ZzL2dmczIv
YW9wcy5jCmluZGV4IGU3OWFkMDg3NTEyYS4uZGFlM2RjNGVlNmY3IDEwMDY0NAotLS0gYS9mcy9n
ZnMyL2FvcHMuYworKysgYi9mcy9nZnMyL2FvcHMuYwpAQCAtMTAsNyArMTAsNyBAQAogI2luY2x1
ZGUgPGxpbnV4L2NvbXBsZXRpb24uaD4KICNpbmNsdWRlIDxsaW51eC9idWZmZXJfaGVhZC5oPgog
I2luY2x1ZGUgPGxpbnV4L3BhZ2VtYXAuaD4KLSNpbmNsdWRlIDxsaW51eC9wYWdldmVjLmg+Cisj
aW5jbHVkZSA8bGludXgvZm9saW9fYmF0Y2guaD4KICNpbmNsdWRlIDxsaW51eC9tcGFnZS5oPgog
I2luY2x1ZGUgPGxpbnV4L2ZzLmg+CiAjaW5jbHVkZSA8bGludXgvd3JpdGViYWNrLmg+CmRpZmYg
LS1naXQgYS9mcy9odWdldGxiZnMvaW5vZGUuYyBiL2ZzL2h1Z2V0bGJmcy9pbm9kZS5jCmluZGV4
IDIyYzc5OTAwMGVkYi4uMmVjM2U0MjMxMjUyIDEwMDY0NAotLS0gYS9mcy9odWdldGxiZnMvaW5v
ZGUuYworKysgYi9mcy9odWdldGxiZnMvaW5vZGUuYwpAQCAtMjUsNyArMjUsNyBAQAogI2luY2x1
ZGUgPGxpbnV4L2N0eXBlLmg+CiAjaW5jbHVkZSA8bGludXgvYmFja2luZy1kZXYuaD4KICNpbmNs
dWRlIDxsaW51eC9odWdldGxiLmg+Ci0jaW5jbHVkZSA8bGludXgvcGFnZXZlYy5oPgorI2luY2x1
ZGUgPGxpbnV4L2ZvbGlvX2JhdGNoLmg+CiAjaW5jbHVkZSA8bGludXgvZnNfcGFyc2VyLmg+CiAj
aW5jbHVkZSA8bGludXgvbW1hbi5oPgogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KZGlmZiAtLWdp
dCBhL2ZzL25pbGZzMi9idHJlZS5jIGIvZnMvbmlsZnMyL2J0cmVlLmMKaW5kZXggZGQwYzhlNTYw
ZWY2Li5iNDAwY2ZjZGM4MDMgMTAwNjQ0Ci0tLSBhL2ZzL25pbGZzMi9idHJlZS5jCisrKyBiL2Zz
L25pbGZzMi9idHJlZS5jCkBAIC0xMCw3ICsxMCw3IEBACiAjaW5jbHVkZSA8bGludXgvc2xhYi5o
PgogI2luY2x1ZGUgPGxpbnV4L3N0cmluZy5oPgogI2luY2x1ZGUgPGxpbnV4L2Vycm5vLmg+Ci0j
aW5jbHVkZSA8bGludXgvcGFnZXZlYy5oPgorI2luY2x1ZGUgPGxpbnV4L2ZvbGlvX2JhdGNoLmg+
CiAjaW5jbHVkZSAibmlsZnMuaCIKICNpbmNsdWRlICJwYWdlLmgiCiAjaW5jbHVkZSAiYnRub2Rl
LmgiCmRpZmYgLS1naXQgYS9mcy9uaWxmczIvcGFnZS5jIGIvZnMvbmlsZnMyL3BhZ2UuYwppbmRl
eCA1NmM0ZGE0MTdiNmEuLmE5ZDhhYTY1NDE2ZiAxMDA2NDQKLS0tIGEvZnMvbmlsZnMyL3BhZ2Uu
YworKysgYi9mcy9uaWxmczIvcGFnZS5jCkBAIC0xNCw3ICsxNCw3IEBACiAjaW5jbHVkZSA8bGlu
dXgvcGFnZS1mbGFncy5oPgogI2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4KICNpbmNsdWRlIDxsaW51
eC9oaWdobWVtLmg+Ci0jaW5jbHVkZSA8bGludXgvcGFnZXZlYy5oPgorI2luY2x1ZGUgPGxpbnV4
L2ZvbGlvX2JhdGNoLmg+CiAjaW5jbHVkZSA8bGludXgvZ2ZwLmg+CiAjaW5jbHVkZSAibmlsZnMu
aCIKICNpbmNsdWRlICJwYWdlLmgiCmRpZmYgLS1naXQgYS9mcy9uaWxmczIvc2VnbWVudC5jIGIv
ZnMvbmlsZnMyL3NlZ21lbnQuYwppbmRleCAwOThhM2JkMTAzZTAuLjZkNjJkZTY0YTMwOSAxMDA2
NDQKLS0tIGEvZnMvbmlsZnMyL3NlZ21lbnQuYworKysgYi9mcy9uaWxmczIvc2VnbWVudC5jCkBA
IC0xOSw3ICsxOSw3IEBACiAjaW5jbHVkZSA8bGludXgvZnJlZXplci5oPgogI2luY2x1ZGUgPGxp
bnV4L2t0aHJlYWQuaD4KICNpbmNsdWRlIDxsaW51eC9jcmMzMi5oPgotI2luY2x1ZGUgPGxpbnV4
L3BhZ2V2ZWMuaD4KKyNpbmNsdWRlIDxsaW51eC9mb2xpb19iYXRjaC5oPgogI2luY2x1ZGUgPGxp
bnV4L3NsYWIuaD4KICNpbmNsdWRlIDxsaW51eC9zY2hlZC9zaWduYWwuaD4KIApkaWZmIC0tZ2l0
IGEvZnMvcmFtZnMvZmlsZS1ub21tdS5jIGIvZnMvcmFtZnMvZmlsZS1ub21tdS5jCmluZGV4IDBm
OGU4MzhlY2UwNy4uMmY3OWJjYjg5ZDJlIDEwMDY0NAotLS0gYS9mcy9yYW1mcy9maWxlLW5vbW11
LmMKKysrIGIvZnMvcmFtZnMvZmlsZS1ub21tdS5jCkBAIC0xNCw3ICsxNCw3IEBACiAjaW5jbHVk
ZSA8bGludXgvc3RyaW5nLmg+CiAjaW5jbHVkZSA8bGludXgvYmFja2luZy1kZXYuaD4KICNpbmNs
dWRlIDxsaW51eC9yYW1mcy5oPgotI2luY2x1ZGUgPGxpbnV4L3BhZ2V2ZWMuaD4KKyNpbmNsdWRl
IDxsaW51eC9mb2xpb19iYXRjaC5oPgogI2luY2x1ZGUgPGxpbnV4L21tYW4uaD4KICNpbmNsdWRl
IDxsaW51eC9zY2hlZC5oPgogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvcGFnZXZlYy5oIGIvaW5jbHVkZS9saW51eC9mb2xpb19iYXRjaC5oCnNpbWls
YXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIGluY2x1ZGUvbGludXgvcGFnZXZlYy5oCnJlbmFt
ZSB0byBpbmNsdWRlL2xpbnV4L2ZvbGlvX2JhdGNoLmgKaW5kZXggMDA3YWZmYWJmMzM1Li5hMmYz
ZDMwNDNmN2UgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvcGFnZXZlYy5oCisrKyBiL2luY2x1
ZGUvbGludXgvZm9saW9fYmF0Y2guaApAQCAtMSwxMyArMSwxMyBAQAogLyogU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KIC8qCi0gKiBpbmNsdWRlL2xpbnV4L3BhZ2V2ZWMuaAor
ICogaW5jbHVkZS9saW51eC9mb2xpb19iYXRjaC5oCiAgKgogICogSW4gbWFueSBwbGFjZXMgaXQg
aXMgZWZmaWNpZW50IHRvIGJhdGNoIGFuIG9wZXJhdGlvbiB1cCBhZ2FpbnN0IG11bHRpcGxlCiAg
KiBmb2xpb3MuICBBIGZvbGlvX2JhdGNoIGlzIGEgY29udGFpbmVyIHdoaWNoIGlzIHVzZWQgZm9y
IHRoYXQuCiAgKi8KIAotI2lmbmRlZiBfTElOVVhfUEFHRVZFQ19ICi0jZGVmaW5lIF9MSU5VWF9Q
QUdFVkVDX0gKKyNpZm5kZWYgX0xJTlVYX0ZPTElPX0JBVENIX0gKKyNkZWZpbmUgX0xJTlVYX0ZP
TElPX0JBVENIX0gKIAogI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CiAKQEAgLTEwMiw0ICsxMDIs
NCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZm9saW9fYmF0Y2hfcmVsZWFzZShzdHJ1Y3QgZm9saW9f
YmF0Y2ggKmZiYXRjaCkKIH0KIAogdm9pZCBmb2xpb19iYXRjaF9yZW1vdmVfZXhjZXB0aW9uYWxz
KHN0cnVjdCBmb2xpb19iYXRjaCAqZmJhdGNoKTsKLSNlbmRpZiAvKiBfTElOVVhfUEFHRVZFQ19I
ICovCisjZW5kaWYgLyogX0xJTlVYX0ZPTElPX0JBVENIX0ggKi8KZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvZm9saW9fcXVldWUuaCBiL2luY2x1ZGUvbGludXgvZm9saW9fcXVldWUuaAppbmRl
eCBhZGFiNjA5Yzk3MmUuLjBkMzc2NWZhOWQxZCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9m
b2xpb19xdWV1ZS5oCisrKyBiL2luY2x1ZGUvbGludXgvZm9saW9fcXVldWUuaApAQCAtMTQsNyAr
MTQsNyBAQAogI2lmbmRlZiBfTElOVVhfRk9MSU9fUVVFVUVfSAogI2RlZmluZSBfTElOVVhfRk9M
SU9fUVVFVUVfSAogCi0jaW5jbHVkZSA8bGludXgvcGFnZXZlYy5oPgorI2luY2x1ZGUgPGxpbnV4
L2ZvbGlvX2JhdGNoLmg+CiAjaW5jbHVkZSA8bGludXgvbW0uaD4KIAogLyoKZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvaW9tYXAuaCBiL2luY2x1ZGUvbGludXgvaW9tYXAuaAppbmRleCA5OWI3
MjA5ZGFiZDcuLjQ1NTE2MTNjZWEyZiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9pb21hcC5o
CisrKyBiL2luY2x1ZGUvbGludXgvaW9tYXAuaApAQCAtOSw3ICs5LDcgQEAKICNpbmNsdWRlIDxs
aW51eC90eXBlcy5oPgogI2luY2x1ZGUgPGxpbnV4L21tX3R5cGVzLmg+CiAjaW5jbHVkZSA8bGlu
dXgvYmxrZGV2Lmg+Ci0jaW5jbHVkZSA8bGludXgvcGFnZXZlYy5oPgorI2luY2x1ZGUgPGxpbnV4
L2ZvbGlvX2JhdGNoLmg+CiAKIHN0cnVjdCBhZGRyZXNzX3NwYWNlOwogc3RydWN0IGZpZW1hcF9l
eHRlbnRfaW5mbzsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc3VucnBjL3N2Yy5oIGIvaW5j
bHVkZS9saW51eC9zdW5ycGMvc3ZjLmgKaW5kZXggNGRjMTRjN2E3MTFiLi5hMTFhY2Y1Y2Q2M2Ig
MTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvc3VucnBjL3N2Yy5oCisrKyBiL2luY2x1ZGUvbGlu
dXgvc3VucnBjL3N2Yy5oCkBAIC0yMCw3ICsyMCw3IEBACiAjaW5jbHVkZSA8bGludXgvbHdxLmg+
CiAjaW5jbHVkZSA8bGludXgvd2FpdC5oPgogI2luY2x1ZGUgPGxpbnV4L21tLmg+Ci0jaW5jbHVk
ZSA8bGludXgvcGFnZXZlYy5oPgorI2luY2x1ZGUgPGxpbnV4L2ZvbGlvX2JhdGNoLmg+CiAjaW5j
bHVkZSA8bGludXgva3RocmVhZC5oPgogCiAvKgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC93
cml0ZWJhY2suaCBiL2luY2x1ZGUvbGludXgvd3JpdGViYWNrLmgKaW5kZXggZTUzMDExMmM0YjNh
Li42MjU1MmEyY2U1YjkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvd3JpdGViYWNrLmgKKysr
IGIvaW5jbHVkZS9saW51eC93cml0ZWJhY2suaApAQCAtMTEsNyArMTEsNyBAQAogI2luY2x1ZGUg
PGxpbnV4L2ZsZXhfcHJvcG9ydGlvbnMuaD4KICNpbmNsdWRlIDxsaW51eC9iYWNraW5nLWRldi1k
ZWZzLmg+CiAjaW5jbHVkZSA8bGludXgvYmxrX3R5cGVzLmg+Ci0jaW5jbHVkZSA8bGludXgvcGFn
ZXZlYy5oPgorI2luY2x1ZGUgPGxpbnV4L2ZvbGlvX2JhdGNoLmg+CiAKIHN0cnVjdCBiaW87CiAK
ZGlmZiAtLWdpdCBhL21tL2ZpbGVtYXAuYyBiL21tL2ZpbGVtYXAuYwppbmRleCA2Y2Q3OTc0ZDRh
ZGEuLjYzZjI1NjMwN2ZkZCAxMDA2NDQKLS0tIGEvbW0vZmlsZW1hcC5jCisrKyBiL21tL2ZpbGVt
YXAuYwpAQCAtMzEsNyArMzEsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2hhc2guaD4KICNpbmNsdWRl
IDxsaW51eC93cml0ZWJhY2suaD4KICNpbmNsdWRlIDxsaW51eC9iYWNraW5nLWRldi5oPgotI2lu
Y2x1ZGUgPGxpbnV4L3BhZ2V2ZWMuaD4KKyNpbmNsdWRlIDxsaW51eC9mb2xpb19iYXRjaC5oPgog
I2luY2x1ZGUgPGxpbnV4L3NlY3VyaXR5Lmg+CiAjaW5jbHVkZSA8bGludXgvY3B1c2V0Lmg+CiAj
aW5jbHVkZSA8bGludXgvaHVnZXRsYi5oPgpkaWZmIC0tZ2l0IGEvbW0vZ3VwLmMgYi9tbS9ndXAu
YwppbmRleCA4ZTdkYzJjNmVlNzMuLmFkOWRlZDM5NjA5YyAxMDA2NDQKLS0tIGEvbW0vZ3VwLmMK
KysrIGIvbW0vZ3VwLmMKQEAgLTE4LDcgKzE4LDcgQEAKICNpbmNsdWRlIDxsaW51eC9odWdldGxi
Lmg+CiAjaW5jbHVkZSA8bGludXgvbWlncmF0ZS5oPgogI2luY2x1ZGUgPGxpbnV4L21tX2lubGlu
ZS5oPgotI2luY2x1ZGUgPGxpbnV4L3BhZ2V2ZWMuaD4KKyNpbmNsdWRlIDxsaW51eC9mb2xpb19i
YXRjaC5oPgogI2luY2x1ZGUgPGxpbnV4L3NjaGVkL21tLmg+CiAjaW5jbHVkZSA8bGludXgvc2ht
ZW1fZnMuaD4KIApkaWZmIC0tZ2l0IGEvbW0vbWVtY29udHJvbC5jIGIvbW0vbWVtY29udHJvbC5j
CmluZGV4IGRiNTlmYWQzNTAzZi4uNTE1MDg1NzM5NjNkIDEwMDY0NAotLS0gYS9tbS9tZW1jb250
cm9sLmMKKysrIGIvbW0vbWVtY29udHJvbC5jCkBAIC0zNCw3ICszNCw3IEBACiAjaW5jbHVkZSA8
bGludXgvc2htZW1fZnMuaD4KICNpbmNsdWRlIDxsaW51eC9odWdldGxiLmg+CiAjaW5jbHVkZSA8
bGludXgvcGFnZW1hcC5oPgotI2luY2x1ZGUgPGxpbnV4L3BhZ2V2ZWMuaD4KKyNpbmNsdWRlIDxs
aW51eC9mb2xpb19iYXRjaC5oPgogI2luY2x1ZGUgPGxpbnV4L3ZtX2V2ZW50X2l0ZW0uaD4KICNp
bmNsdWRlIDxsaW51eC9zbXAuaD4KICNpbmNsdWRlIDxsaW51eC9wYWdlLWZsYWdzLmg+CmRpZmYg
LS1naXQgYS9tbS9tbG9jay5jIGIvbW0vbWxvY2suYwppbmRleCAyZjY5OWMzNDk3YTUuLjFhOTJk
MTZmMzY4NCAxMDA2NDQKLS0tIGEvbW0vbWxvY2suYworKysgYi9tbS9tbG9jay5jCkBAIC0xMyw3
ICsxMyw3IEBACiAjaW5jbHVkZSA8bGludXgvc3dhcC5oPgogI2luY2x1ZGUgPGxpbnV4L3N3YXBv
cHMuaD4KICNpbmNsdWRlIDxsaW51eC9wYWdlbWFwLmg+Ci0jaW5jbHVkZSA8bGludXgvcGFnZXZl
Yy5oPgorI2luY2x1ZGUgPGxpbnV4L2ZvbGlvX2JhdGNoLmg+CiAjaW5jbHVkZSA8bGludXgvcGFn
ZXdhbGsuaD4KICNpbmNsdWRlIDxsaW51eC9tZW1wb2xpY3kuaD4KICNpbmNsdWRlIDxsaW51eC9z
eXNjYWxscy5oPgpkaWZmIC0tZ2l0IGEvbW0vcGFnZS13cml0ZWJhY2suYyBiL21tL3BhZ2Utd3Jp
dGViYWNrLmMKaW5kZXggNjAxYTVlMDQ4ZDEyLi4xMDA5YmIwNDJiYTQgMTAwNjQ0Ci0tLSBhL21t
L3BhZ2Utd3JpdGViYWNrLmMKKysrIGIvbW0vcGFnZS13cml0ZWJhY2suYwpAQCAtMzMsNyArMzMs
NyBAQAogI2luY2x1ZGUgPGxpbnV4L3N5c2N0bC5oPgogI2luY2x1ZGUgPGxpbnV4L2NwdS5oPgog
I2luY2x1ZGUgPGxpbnV4L3N5c2NhbGxzLmg+Ci0jaW5jbHVkZSA8bGludXgvcGFnZXZlYy5oPgor
I2luY2x1ZGUgPGxpbnV4L2ZvbGlvX2JhdGNoLmg+CiAjaW5jbHVkZSA8bGludXgvdGltZXIuaD4K
ICNpbmNsdWRlIDxsaW51eC9zY2hlZC9ydC5oPgogI2luY2x1ZGUgPGxpbnV4L3NjaGVkL3NpZ25h
bC5oPgpkaWZmIC0tZ2l0IGEvbW0vcGFnZV9hbGxvYy5jIGIvbW0vcGFnZV9hbGxvYy5jCmluZGV4
IGQ4OGM4YzY3YWMwYi4uNzRiNjAzODcyZjM0IDEwMDY0NAotLS0gYS9tbS9wYWdlX2FsbG9jLmMK
KysrIGIvbW0vcGFnZV9hbGxvYy5jCkBAIC0zMSw3ICszMSw3IEBACiAjaW5jbHVkZSA8bGludXgv
c3lzY3RsLmg+CiAjaW5jbHVkZSA8bGludXgvY3B1Lmg+CiAjaW5jbHVkZSA8bGludXgvY3B1c2V0
Lmg+Ci0jaW5jbHVkZSA8bGludXgvcGFnZXZlYy5oPgorI2luY2x1ZGUgPGxpbnV4L2ZvbGlvX2Jh
dGNoLmg+CiAjaW5jbHVkZSA8bGludXgvbWVtb3J5X2hvdHBsdWcuaD4KICNpbmNsdWRlIDxsaW51
eC9ub2RlbWFzay5oPgogI2luY2x1ZGUgPGxpbnV4L3Ztc3RhdC5oPgpkaWZmIC0tZ2l0IGEvbW0v
c2htZW0uYyBiL21tL3NobWVtLmMKaW5kZXggY2ZlZDZjM2ZmODUzLi4xNDlmZGIwNTExNzAgMTAw
NjQ0Ci0tLSBhL21tL3NobWVtLmMKKysrIGIvbW0vc2htZW0uYwpAQCAtNjEsNyArNjEsNyBAQCBz
dGF0aWMgc3RydWN0IHZmc21vdW50ICpzaG1fbW50IF9fcm9fYWZ0ZXJfaW5pdDsKICNpbmNsdWRl
IDxsaW51eC9zbGFiLmg+CiAjaW5jbHVkZSA8bGludXgvYmFja2luZy1kZXYuaD4KICNpbmNsdWRl
IDxsaW51eC93cml0ZWJhY2suaD4KLSNpbmNsdWRlIDxsaW51eC9wYWdldmVjLmg+CisjaW5jbHVk
ZSA8bGludXgvZm9saW9fYmF0Y2guaD4KICNpbmNsdWRlIDxsaW51eC9wZXJjcHVfY291bnRlci5o
PgogI2luY2x1ZGUgPGxpbnV4L2ZhbGxvYy5oPgogI2luY2x1ZGUgPGxpbnV4L3NwbGljZS5oPgpk
aWZmIC0tZ2l0IGEvbW0vc3dhcC5jIGIvbW0vc3dhcC5jCmluZGV4IGJiMTljY2JlY2U0Ni4uMmU1
MTdlZGU2NTYxIDEwMDY0NAotLS0gYS9tbS9zd2FwLmMKKysrIGIvbW0vc3dhcC5jCkBAIC0yMCw3
ICsyMCw3IEBACiAjaW5jbHVkZSA8bGludXgvc3dhcC5oPgogI2luY2x1ZGUgPGxpbnV4L21tYW4u
aD4KICNpbmNsdWRlIDxsaW51eC9wYWdlbWFwLmg+Ci0jaW5jbHVkZSA8bGludXgvcGFnZXZlYy5o
PgorI2luY2x1ZGUgPGxpbnV4L2ZvbGlvX2JhdGNoLmg+CiAjaW5jbHVkZSA8bGludXgvaW5pdC5o
PgogI2luY2x1ZGUgPGxpbnV4L2V4cG9ydC5oPgogI2luY2x1ZGUgPGxpbnV4L21tX2lubGluZS5o
PgpkaWZmIC0tZ2l0IGEvbW0vc3dhcF9zdGF0ZS5jIGIvbW0vc3dhcF9zdGF0ZS5jCmluZGV4IDMy
ZDlkODc3YmRhOC4uYTBjNjRkYjJiMjc1IDEwMDY0NAotLS0gYS9tbS9zd2FwX3N0YXRlLmMKKysr
IGIvbW0vc3dhcF9zdGF0ZS5jCkBAIC0xNSw3ICsxNSw3IEBACiAjaW5jbHVkZSA8bGludXgvbGVh
Zm9wcy5oPgogI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KICNpbmNsdWRlIDxsaW51eC9wYWdlbWFw
Lmg+Ci0jaW5jbHVkZSA8bGludXgvcGFnZXZlYy5oPgorI2luY2x1ZGUgPGxpbnV4L2ZvbGlvX2Jh
dGNoLmg+CiAjaW5jbHVkZSA8bGludXgvYmFja2luZy1kZXYuaD4KICNpbmNsdWRlIDxsaW51eC9i
bGtkZXYuaD4KICNpbmNsdWRlIDxsaW51eC9taWdyYXRlLmg+CmRpZmYgLS1naXQgYS9tbS90cnVu
Y2F0ZS5jIGIvbW0vdHJ1bmNhdGUuYwppbmRleCAxMjQ2N2MxYmQ3MTEuLmRmMGI3YTdlNmFmZiAx
MDA2NDQKLS0tIGEvbW0vdHJ1bmNhdGUuYworKysgYi9tbS90cnVuY2F0ZS5jCkBAIC0xNyw3ICsx
Nyw3IEBACiAjaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+CiAjaW5jbHVkZSA8bGludXgvcGFnZW1h
cC5oPgogI2luY2x1ZGUgPGxpbnV4L2hpZ2htZW0uaD4KLSNpbmNsdWRlIDxsaW51eC9wYWdldmVj
Lmg+CisjaW5jbHVkZSA8bGludXgvZm9saW9fYmF0Y2guaD4KICNpbmNsdWRlIDxsaW51eC90YXNr
X2lvX2FjY291bnRpbmdfb3BzLmg+CiAjaW5jbHVkZSA8bGludXgvc2htZW1fZnMuaD4KICNpbmNs
dWRlIDxsaW51eC9ybWFwLmg+CmRpZmYgLS1naXQgYS9tbS92bXNjYW4uYyBiL21tL3Ztc2Nhbi5j
CmluZGV4IDdlZmZkMDFhNzgyOC4uN2U5MjFkYmUyMzczIDEwMDY0NAotLS0gYS9tbS92bXNjYW4u
YworKysgYi9tbS92bXNjYW4uYwpAQCAtNDQsNyArNDQsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3N5
c2N0bC5oPgogI2luY2x1ZGUgPGxpbnV4L21lbW9yeS10aWVycy5oPgogI2luY2x1ZGUgPGxpbnV4
L29vbS5oPgotI2luY2x1ZGUgPGxpbnV4L3BhZ2V2ZWMuaD4KKyNpbmNsdWRlIDxsaW51eC9mb2xp
b19iYXRjaC5oPgogI2luY2x1ZGUgPGxpbnV4L3ByZWZldGNoLmg+CiAjaW5jbHVkZSA8bGludXgv
cHJpbnRrLmg+CiAjaW5jbHVkZSA8bGludXgvZGF4Lmg+CgotLSAKMi4zOS41CgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
