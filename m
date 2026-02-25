Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHh6N3uJn2mmcgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 00:44:59 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 009DA19EFA8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 00:44:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:MIME-Version:Message-Id:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IlGqqYmOokCtt5dw1Oqz5BEhOM3zNbOmZ52gBl7j3C0=; b=ALwEIZfbNzh3Y7rI4FBLP+rQu/
	wwX3Cy7KQy7qCckqbcZgqJ+M77CkIpdscA3ebvFimGbMNm+j2OKr2a0HuDIIS5aoM43GTbEQfCZKt
	qgUoYUWh7nKuAEY/jYHxfaFR94cgbcVat/SsnfOeNwHwxPX6q8uqdyZ6Ft8duj6NyKg0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvOYp-0006y2-67;
	Wed, 25 Feb 2026 23:44:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tz2294@columbia.edu>) id 1vvOYm-0006xt-Ai
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Feb 2026 23:44:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=05jgbknsbqZP1uCdgxmv7u4HMptdcfek0XZsU81eJwo=; b=GKCuctrUVWOE9HaNuPDJyqGsu3
 tYFIBybC9/Bk3pePee38KNmFOweD+H8WnFRYNs00mydXbmdR7FGVyoAXSl57Wng0cRwUmchZ9chx5
 uWEyqlqETxd67KIFvjB8eRuisplFbGz3Tb6XllKlpRQS+wvnnr/jLkz+Zin2E8RhLAP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=05jgbknsbqZP1uCdgxmv7u4HMptdcfek0XZsU81eJwo=; b=K
 LcDEsmE73omMSEhgoe+QtIZ0kwZuH6jP0yxttyc7x6yHcfy9q6CHTf3/5aO5RnPELgYV0vCoP3OBl
 khYj5uNvX3NXeD728RG+Gv7TRQiqby6AuonwB61MqkxoLZO9ArNVGLVEU9sKbK4ZxHuNhthtz1bQl
 Omb/mHR+Dxu40WBA=;
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvOYl-000177-L2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Feb 2026 23:44:52 +0000
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
 by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61PNNQ6E3372064
 for <linux-f2fs-devel@lists.sourceforge.net>; Wed, 25 Feb 2026 18:44:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=pps01; bh=05jgbknsbqZP1uCdgxmv7u4HMp
 tdcfek0XZsU81eJwo=; b=NZaA/URTtN755x3xQdd19/fuZUZtYv1FQpcevc3XwH
 GiJ5HRxGcY9iy/OYljXRxusFlBguMsPnyZDcmgj6ga3FB3ZEB6s8V8MYK1RQkRqs
 73E3y2Il0kMvjM1FeCKvErS6Ge1o+L/OrnSKHrzy/0gMDrz4XGhlptm9EW5EZsiN
 KbNXNDLUxHRAHYoImMhwtPfSo5MKLD5TPNctjPWYbFCDuzg3+QLXfj4h+8nzvl+h
 eF35anfVfxgICHTPN/s3s6nvmvXB97+RSUwbstEdYahxR2kI4oqGBDlsjZPhkjFA
 35Gntn163Y2SMifNAIheBj42FBACqKtXgkrnpRQmM3NQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4chs0qf8rt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Feb 2026 18:44:40 -0500 (EST)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-899b6a1a557so27054816d6.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Feb 2026 15:44:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772063080; x=1772667880;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=05jgbknsbqZP1uCdgxmv7u4HMptdcfek0XZsU81eJwo=;
 b=W2TQ6FHLfuYJaMK+hFL9pymPaRbQAOC70YJszQD+E5fzRCN2/peHZxu91GD6ABmgHI
 yqGfHBSxTlKH6HvcBFKdI8uqd9wj/8J21sUeLwTbP/3IaI2cVEsJbLnhl1yczewqGfC3
 u4lbYAZgJwvD323O7Lq4Rhx2y+J8Tt5qkNN++l9KViB1VBq6aJ+veUCULZfz3eOqnJdK
 EzyMVXukvZNYjVgPmFuLb79z3o1tVv8UFQ1tc1UvMFu4ZRD5mYsN37OWYcChprY4wZiY
 agY+3OlUdhxkhcF590oc2g97WLtqsVuUH5Yj8TJBwhXLHQQP1nXwEo1sYAYxIG4d4f1V
 geuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9G9WCrdzvT2GtID32ZNnmc5WL3Zi/QE3D8rIJ3xxfVl6slMIlBWX+sjIenHamh3czG0PbzfgPnw3sMg5C7GDu@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxo9F+Je4iWRmZNiYP18RU5i36GxmCx279zsQf5bqs7DWgUHroQ
 wcjOdkai3YMmNB94QzNfHw5hERndzu3fn8wWXyeWzm+n1k14P50aRJjYsqUtb7ZAei5JZGu23gt
 2sZgvmCcGmEEk0HQ+qhB5yR4gg+ZHkak5rjBkUz2uIEng6ctRIJM5mWXIga1ntmTlmUHJkJccX+
 Q=
X-Gm-Gg: ATEYQzykVTkXdEe+Lfz3v3XbdGi7YHnOrm1bZwNPKegd4sXEHhCR2Zj1e5yogi7pddq
 gdtyTQ8Q4cb82bBEJu5v9A3zKOia5gkRYfBVCJEyT1dCIZcmdmlInT0i8rwQ2WT+FaqlU7UvW7J
 IHidwTiC4xehQA9euQZKibk53R/lYPmU6L6kDv5+5BPlfEJlW5xb6NAJxmHhN2EzGWyLGSn8Z2X
 E2pL9meEwloK1I9MpfcmpgjGcItvsI99wWWJ2bVS6JVGlEKo2+80xUcrLXpyr0VO6kqun5u+zdC
 R6hKMWHYGxSBwNT9m0Ci9XOlLhzwEjXJD1ZsXXIoe+5kxz47N9pWeIhgIIW2eZukCtIgQe1SCCE
 ILYl+E4Mc94owFdTEn0/4D7H2FZ6loyce
X-Received: by 2002:a05:6214:4387:b0:894:663f:cb4b with SMTP id
 6a1803df08f44-89979e31f4amr253354306d6.7.1772063080135; 
 Wed, 25 Feb 2026 15:44:40 -0800 (PST)
X-Received: by 2002:a05:6214:4387:b0:894:663f:cb4b with SMTP id
 6a1803df08f44-89979e31f4amr253353936d6.7.1772063079588; 
 Wed, 25 Feb 2026 15:44:39 -0800 (PST)
Received: from [127.0.1.1] ([216.158.158.246])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-899c738d80bsm3357606d6.41.2026.02.25.15.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 15:44:39 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 25 Feb 2026 18:44:24 -0500
Message-Id: <20260225-pagevec_cleanup-v2-0-716868cc2d11@columbia.edu>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFiJn2kC/3WNQQ6CMBBFr0JmbQ0dsBpX3sMQU9oBJkFoWttoS
 O9uZe/yveS/v0EgzxTgWm3gKXHgdSmAhwrMpJeRBNvCgDWqGvEknB4pkXmYmfQSnbDt2Uhl+np
 AC2XlPA383ov3rvDE4bX6z36Q5M/+byUppGguhNiqRjUWb2ad47NnfSQbocs5fwEZhc9ksQAAA
 A==
X-Change-ID: 20260225-pagevec_cleanup-d47c16cb0f2d
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772063077; l=3877;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=RPYa8SOtCEMGYvfhLiG7oMZP0LUGjYMFBvMU/E6aYSQ=;
 b=N/1edh2L6XTHkwD9ieSfOXn9kYa5DYTkRpLgb6W+Pjo3fqU/OShuTpJ0EUyLfSHC66PI9wcY+
 BU8+4Nx0zdtBWryBzWRqlHj5gGJzMg+bWxBXZztU9BaHETUf5RWJ+Bm
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=ZbYQ98VA c=1 sm=1 tr=0 ts=699f8968 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=mD05b5UW6KhLIDvowZ5dSQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=x7bEGLp0ZPQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=VwQbUJbxAAAA:8 a=C2eTfLYCeeefI48a-yAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: vOq13Q43MaUDKZGqUUHO4wVCLET3XMHe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDIyNyBTYWx0ZWRfXxHjllNXQ6v8S
 XdMnLBttK5J10lVnQfBlWDLLdmp4V4zzw+ClvWR65NzhhcC9JuyCgQ7IkXHt1wa27fmkwLwLN4c
 5uuFOHELWYRbRGDAU1Kw0Hhq0lSifGKu7ayu9KugtLR4YZRvMIhagsrZqIWAtab500qcYjEPYqf
 UAdLhB6DD+6CqghkqLKIuF/rlLrj5FBpcUXsH4qTp6I95TPkxyYueVefY0APuLttIXaQqy9zPHj
 z1JMSGccEFcwhAyCBP0bzluZokabO9gcWtn87xvrsUhvx+KyyL4Yf+B74JKivBRprqWqzYzyXZH
 n2Y8K3TRx9KfNAapLcqA7uPSy6L/C7RSgHG3r1TsxKnkj44mKsBxMR90rNO94xIy2AHBCovwrKD
 0fz0WV8Des93DafDPpiTcejRIjBUCkQtGT1DMg3hxF77872bqL8ETJ07fgZyOeQtPrK3fgEQjLF
 iy9ynuogWqI/5JN0unQ==
X-Proofpoint-ORIG-GUID: vOq13Q43MaUDKZGqUUHO4wVCLET3XMHe
X-Proofpoint-Virus-Version: vendor=nai engine=6800 definitions=11712
 signatures=596818
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=10
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=10 adultscore=0
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250227
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: struct pagevec was removed in commit 1e0877d58b1e ("mm:
 remove
 struct pagevec"). Remove any stray references to it and rename relevant files
 and macros accordingly. While at it, remove unnecessary #includes of pagevec.h
 (now folio_batch.h) in .c files. There are probably more of these that could
 be removed in .h files, but those are more complex to verify. 
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
X-Headers-End: 1vvOYl-000177-L2
Subject: [f2fs-dev] [PATCH v2 0/4] mm: Remove stray references to pagevec
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[columbia.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dhowells@redhat.com,m:marc.dionne@auristor.com,m:jaegeuk@kernel.org,m:chao@kernel.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:baohua@kernel.org,m:willy@infradead.org,m:dan.j.williams@intel.com,m:jack@suse.cz,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:tytso@mit.edu,m:nvdimm@lists.linux.dev,m:tz2294@columbia.edu,m:pc@manguebit.org,m:amarkuze@redhat.com,m:djwong@kernel.org,m:joonas.lahtinen@linux.intel.com,m:peterx@redhat.com,m:yuanchu@google.com,m:linux-mm@kvack.org,m:clm@fb.com,m:hughd@google.com,m:adilger.kernel@dilger.ca,m:pfalcato@suse.de,m:samba-technical@lists.samba.org,m:linux-xfs@vger.kernel.org,m:airlied@gmail.com,m:linux-afs@lists.infradead.org,m:simona@ffwll.ch,m:linux-cifs@vger.kernel.org,m:linux-nil
 fs@vger.kernel.org,m:agruenba@redhat.com,m:mark@fasheh.com,m:zhengqi.arch@bytedance.com,m:roman.gushchin@linux.dev,m:Dai.Ngo@oracle.com,m:tursulin@ursulin.net,m:jgg@ziepe.ca,m:slava@dubeyko.com,m:ziy@nvidia.com,m:neil@brown.name,m:axelrasmussen@google.com,m:idryomov@gmail.com,m:linux-ext4@vger.kernel.org,m:weixugc@google.com,m:sprasad@microsoft.com,m:okorniev@redhat.com,m:anna@kernel.org,m:jannh@google.com,m:jhubbard@nvidia.com,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:cgroups@vger.kernel.org,m:mripard@kernel.org,m:tom@talpey.com,m:ocfs2-devel@lists.linux.dev,m:bharathsm@microsoft.com,m:jlbec@evilplan.org,m:ronniesahlberg@gmail.com,m:rodrigo.vivi@intel.com,m:dsterba@suse.com,m:shakeel.butt@linux.dev,m:ceph-devel@vger.kernel.org,m:konishi.ryusuke@gmail.com,m:osalvador@suse.de,m:jani.nikula@linux.intel.com,m:gfs2@lists.linux.dev,m:linux-nfs@vger.kernel.org,m:baolin.wang@linux.alibaba.com,m:joseph.qi@linux.alibaba.com,m:dri-devel@lists.freedesktop.org,m:mu
 chun.song@linux.dev,m:jlayton@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:chuck.lever@oracle.com,m:linux-btrfs@vger.kernel.org,m:tzimmermann@suse.de,m:hannes@cmpxchg.org,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:jackmanb@google.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[tz2294@columbia.edu,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,columbia.edu:s=pps01];
	FREEMAIL_TO(0.00)[redhat.com,auristor.com,kernel.org,linux-foundation.org,oracle.com,google.com,suse.com,tencent.com,huaweicloud.com,gmail.com,infradead.org,intel.com,suse.cz,zeniv.linux.org.uk,mit.edu];
	FREEMAIL_CC(0.00)[lists.linux.dev,columbia.edu,manguebit.org,redhat.com,kernel.org,linux.intel.com,google.com,kvack.org,fb.com,dilger.ca,suse.de,lists.samba.org,vger.kernel.org,gmail.com,lists.infradead.org,ffwll.ch,fasheh.com,bytedance.com,linux.dev,oracle.com,ursulin.net,ziepe.ca,dubeyko.com,nvidia.com,brown.name,microsoft.com,lists.freedesktop.org,talpey.com,evilplan.org,intel.com,suse.com,linux.alibaba.com,lists.sourceforge.net,samba.org,cmpxchg.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[columbia.edu:mid,columbia.edu:email];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tz2294@columbia.edu,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,columbia.edu:-];
	RCPT_COUNT_GT_50(0.00)[97];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 009DA19EFA8
X-Rspamd-Action: no action

struct pagevec was removed in commit 1e0877d58b1e ("mm: remove struct
pagevec"). Remove any stray references to it and rename relevant files
and macros accordingly.

While at it, remove unnecessary #includes of pagevec.h (now
folio_batch.h) in .c files. There are probably more of these that could
be removed in .h files, but those are more complex to verify.

---
Changes in v2:
- Add tags from Matthew, David, and Chris (thanks!).
- Add 3 new patches with more cleanups.
- Link to v1: https://lore.kernel.org/r/20260225-pagevec_cleanup-v1-1-38e2246363d2@columbia.edu

---
Tal Zussman (4):
      mm: Remove stray references to struct pagevec
      fs: Remove unncessary pagevec.h includes
      folio_batch: Rename pagevec.h to folio_batch.h
      folio_batch: Rename PAGEVEC_SIZE to FOLIO_BATCH_SIZE

 MAINTAINERS                                |  1 +
 drivers/gpu/drm/drm_gem.c                  |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c  |  2 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h        |  2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c      |  2 +-
 fs/afs/internal.h                          |  1 -
 fs/afs/write.c                             |  1 -
 fs/btrfs/compression.c                     |  2 +-
 fs/btrfs/extent_io.c                       |  6 +++---
 fs/btrfs/tests/extent-io-tests.c           |  2 +-
 fs/buffer.c                                |  2 +-
 fs/ceph/addr.c                             |  2 +-
 fs/dax.c                                   |  1 -
 fs/ext4/file.c                             |  1 -
 fs/ext4/inode.c                            |  2 +-
 fs/ext4/page-io.c                          |  1 -
 fs/ext4/readpage.c                         |  1 -
 fs/f2fs/checkpoint.c                       |  2 +-
 fs/f2fs/compress.c                         |  2 +-
 fs/f2fs/data.c                             |  2 +-
 fs/f2fs/f2fs.h                             |  2 --
 fs/f2fs/file.c                             |  1 -
 fs/f2fs/node.c                             |  2 +-
 fs/gfs2/aops.c                             |  2 +-
 fs/hugetlbfs/inode.c                       |  2 +-
 fs/mpage.c                                 |  1 -
 fs/netfs/buffered_write.c                  |  1 -
 fs/nfs/blocklayout/blocklayout.c           |  1 -
 fs/nfs/dir.c                               |  1 -
 fs/nilfs2/btree.c                          |  2 +-
 fs/nilfs2/page.c                           |  2 +-
 fs/nilfs2/segment.c                        |  2 +-
 fs/ocfs2/refcounttree.c                    |  1 -
 fs/ramfs/file-nommu.c                      |  2 +-
 fs/smb/client/connect.c                    |  1 -
 fs/smb/client/file.c                       |  1 -
 include/linux/{pagevec.h => folio_batch.h} | 16 ++++++++--------
 include/linux/folio_queue.h                |  8 ++++----
 include/linux/iomap.h                      |  2 +-
 include/linux/sunrpc/svc.h                 |  2 +-
 include/linux/swap.h                       |  2 --
 include/linux/writeback.h                  |  2 +-
 mm/filemap.c                               |  2 +-
 mm/gup.c                                   |  2 +-
 mm/memcontrol.c                            |  2 +-
 mm/mlock.c                                 |  2 +-
 mm/page-writeback.c                        |  2 +-
 mm/page_alloc.c                            |  2 +-
 mm/shmem.c                                 |  6 +++---
 mm/swap.c                                  |  4 ++--
 mm/swap_state.c                            |  4 ++--
 mm/truncate.c                              |  8 ++++----
 mm/vmscan.c                                |  2 +-
 53 files changed, 56 insertions(+), 73 deletions(-)
---
base-commit: 957a3fab8811b455420128ea5f41c51fd23eb6c7
change-id: 20260225-pagevec_cleanup-d47c16cb0f2d

Best regards,
-- 
Tal Zussman <tz2294@columbia.edu>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
