Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGUIJH2Jn2nMcgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 00:45:01 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 065EF19EFB7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 00:45:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:In-Reply-To:References:Message-Id:MIME-Version:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrVQ0O3RXgxEJ/WFxyqui69ViTmXXbRyOy/+KB32PNM=; b=W/jsbBo439a0xb5h7qYdF4msxi
	yak/ytnVztP1Risy4Vo+PW5NnQhhBec51M5Ph2Vn5GTSIFe/14NiOpgf2YUJCfKbe+Nz3nCCvd4JZ
	OY/VGCacIzhpOI0cIlIcGEZyri2Tx880kKZWiIH+PLJCPWwjyjr0rpwV3+XkHG5vFkjY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvOYt-0007jm-NL;
	Wed, 25 Feb 2026 23:44:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tz2294@columbia.edu>) id 1vvOYr-0007je-SF
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Feb 2026 23:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q1k2aRLcgmydoMd1dEiHPTc9xxnOTAMtx9b+CM6PXh0=; b=JJTL++jCbBhAZN3eDgMKfQST9Z
 xBnb2mTbeSBYV38r7Wkt3VnbYr10FTXAsdmZUUi8uqxMDMtVKrD7JwhlRx8RZdhzCsECcFONyF9vj
 6L5qxsjIdc1iFMyRJqxyN3pPyN4FxIHd6p5uhdFVdogEWJCRf6W6YuGFJuMjmSHonmAY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q1k2aRLcgmydoMd1dEiHPTc9xxnOTAMtx9b+CM6PXh0=; b=kD97UMB8kiRkO7zYmU98738+55
 9ntOu2eaNU7uAHT6SgVSsHOzh4wqQz9USZJgm7yUOXBagmLjbg8j73gBZI6D4yEsxqX1fRcOsB3nY
 bokoI6Q3PkvWi0tNL5SkKvJ6I32toUpFw1fWivsnfJUJ/p23qG9qjZ01sG3iVaSHyB4o=;
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvOYr-00017Q-5X for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Feb 2026 23:44:57 +0000
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
 by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61PNNf1H340040
 for <linux-f2fs-devel@lists.sourceforge.net>; Wed, 25 Feb 2026 18:44:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pps01; bh=Q1k2
 aRLcgmydoMd1dEiHPTc9xxnOTAMtx9b+CM6PXh0=; b=U1PIVhaQRwd3nbrNnYtm
 L1no1lMCV2YmzeST//Dp/v7B3/cqL4T65QQrGFeq4b08zK5Y2bNTbh+NZ0dvRq8L
 fWxAXdfzylJQAflLxh8iC6HUOyaR7ki6/xPgiP+/NrizW4D7zaK1w0+W4ErGSFUd
 W0ErFErP2OIoxqkEv58jTOIg5iLwKzU7KKkGTTglXZHlYByD0dZEd4gm2XRonTBf
 IAwk64JaWJh5SI6PlHFHgjkB1xFbM72XAqyzdYvOCmP5fAPuCzBajwGH0E/vZsKp
 WVFnR0ForMBT3YjkIm2sCMYMPztXn+cqf57JO1rCfMS6vvmcio9eEyqAYlqMbGkD
 Vw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4chywywwtu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Feb 2026 18:44:45 -0500 (EST)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-896fa0fcf27so25571606d6.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Feb 2026 15:44:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772063085; x=1772667885;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Q1k2aRLcgmydoMd1dEiHPTc9xxnOTAMtx9b+CM6PXh0=;
 b=AS17w6YA/rXE+9i3rj6rAsct0PYVrXIjljCTNP+RmcbElFMT5K9KW7Sg4z8cplHFKo
 72dRYGpSZ0jrY69gDI8LUMU2bQVonfcCJ+40MovsR9L08xgWNIkqJHM2OoM9afuY56U1
 kVSSwbugT/wUNEFX2//rlW0nsayzZPQ9Gzjx8UmILCbOriCs6NFtQK1s5lb0B+mhe1WF
 YyxKQnSdgigMQ1IvzIDhn80YqEycD/W7OWppcHvxUiPA8pnXBAA/fzyc7igXMOjJi5Yc
 5AYDGXIla9hG111BKmtAS5IEPdRACBMEe48nUsn+zJD6eSO6u4csnDPuUDI0+SRT4Txu
 S8Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiqkbo9vspcXUiEc+IbEjYvZfo+i3UeVhhRJe4CPHqd2J04/xAY+jaTb2q5FBZcUwUET99dwnnJv/iUbUcA54C@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzeQ+QDx2Oj4WK7xOw85tW2bPV1UTyU5isThjs0PvziKzi2s0mt
 soNcYH6bnxBCYjbXjM5nTWstS/5Z+Jz8MAVqhVaVFNcpsS8Z7LL+Pp6gk6nj4O8syFdf0+rQ/AY
 7d2kn4YSnxkkG39mn47YU+qG/4dHAXzmIlF62tiTDncTlYfnf8J40fIMuJ2C/xKWBF3BYkW92ew
 8=
X-Gm-Gg: ATEYQzzYHKWjvdQ8C9bDo0EaIX/rSqYRtE2fu/qfngBoh2lACzYmiSw0PPUgKiV4Z8j
 i5NPE/cjswViTUDLSCKIC7HHIphmYT3M02Xg/5uUfAVgRGMgNXOkJRb6hApCQk+xjoEwnzsXu85
 j0HuF1672nrL1DnAfDj9tIUQbSCDZ4y/jtkHFvpKAj1Ze2R4w0vpbm5LQRd5ZXaiZE4/Q+1Po8V
 jyyjc7HuxyPUb3reRDpU/FwdAMXpEjajvKogx/HJuz2M26KW7xKbZUn4CDbWovk1fySAhf64qHd
 UFP6K6L4CxvqhsLMmTAbRVJvBrsTLbWg7HjXX8u1GUabchjMLORy0oqVxnOd/o4tLgYdapJLKIJ
 wQ1SO0BEqecnAx+znxu5Sk+N0oyKXAeJ8
X-Received: by 2002:a05:6214:21ea:b0:895:7864:f69a with SMTP id
 6a1803df08f44-89979eedb2amr279116156d6.46.1772063085002; 
 Wed, 25 Feb 2026 15:44:45 -0800 (PST)
X-Received: by 2002:a05:6214:21ea:b0:895:7864:f69a with SMTP id
 6a1803df08f44-89979eedb2amr279115656d6.46.1772063084415; 
 Wed, 25 Feb 2026 15:44:44 -0800 (PST)
Received: from [127.0.1.1] ([216.158.158.246])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-899c738d80bsm3357606d6.41.2026.02.25.15.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 15:44:43 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 25 Feb 2026 18:44:26 -0500
MIME-Version: 1.0
Message-Id: <20260225-pagevec_cleanup-v2-2-716868cc2d11@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772063077; l=5646;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=gYLxuKpY2d3qKNQKxivfKoBOKiAm81D0oxjvJeYJzNU=;
 b=0+QFbVO+EVyu3LcoNlltI7+0YkfiOzPAREHRqHF+/vRJBoggqFw4V6DeYqoYE35EGaZ0z2yM5
 xg7WRatCQDeAtdc5+Wn8weZAkk+lk9tyDOPYyXE2pnCtDyQNUNup7UV
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: Dhp_oSmHRTE9M_qOna7S0yjlJWUaFZOp
X-Authority-Analysis: v=2.4 cv=ccTfb3DM c=1 sm=1 tr=0 ts=699f896d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=mD05b5UW6KhLIDvowZ5dSQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=x7bEGLp0ZPQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=_wBAnLaIECucki5onNwA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDIyNyBTYWx0ZWRfX/oCGo9WsDtyN
 Z7drdn2nHnPr9uW7Fb6qY039Tj93U3BbKBGds0hS6kLgO8wXXFUvV3UDkttIFneA4Cz3xUjR03g
 oPqbKbyenUOXdMc6/QlLW33L7e2nLEcQaKHV8288vRHNcy2BcryfWBWUPKRny75wXy6NlmIeWje
 zYgkj8so568lnBCa/5wbuO6+8i0XGbmwnCwERZkWd+snrQxQvI0fEJ2PgulwgWJ2F7kOflestHZ
 tL2p8VAeCnAmeBog4LcCWw3BcBNOrzpkmc26M9IkIAZhfiL9ss03bDuHXEoJzIJThu82wOCVx02
 /7ZE3GF3s9ELgzDsh/V6mCdXM7E3udskSLcVE7JokZXc5tOO15+JUMguEDLVjnYCtrEZy+cgLRz
 JbfBLkJ6XRBbGT8mtuTI3Fc8Gp3v4YGWXwM7aK8bPRBM/8U/Ii3qnayKAiPxlCIxvTKGsi7hxgZ
 xfynSTtueGKFmHhx7pg==
X-Proofpoint-GUID: Dhp_oSmHRTE9M_qOna7S0yjlJWUaFZOp
X-Proofpoint-Virus-Version: vendor=nai engine=6800 definitions=11712
 signatures=596818
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 adultscore=0 clxscore=1015 spamscore=0 impostorscore=10
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250227
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Remove unused pagevec.h includes from .c files. These were
 found with the following command: grep -rl '#include.*pagevec\.h'
 --include='*.c'
 | while read f; do grep -qE 'PAGEVEC_SIZE|folio_batch' "$f" || echo "$f"
 done Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1vvOYr-00017Q-5X
Subject: [f2fs-dev] [PATCH v2 2/4] fs: Remove unncessary pagevec.h includes
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[columbia.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dhowells@redhat.com,m:marc.dionne@auristor.com,m:jaegeuk@kernel.org,m:chao@kernel.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:baohua@kernel.org,m:willy@infradead.org,m:dan.j.williams@intel.com,m:jack@suse.cz,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:tytso@mit.edu,m:nvdimm@lists.linux.dev,m:tz2294@columbia.edu,m:pc@manguebit.org,m:amarkuze@redhat.com,m:djwong@kernel.org,m:joonas.lahtinen@linux.intel.com,m:peterx@redhat.com,m:yuanchu@google.com,m:linux-mm@kvack.org,m:clm@fb.com,m:hughd@google.com,m:adilger.kernel@dilger.ca,m:pfalcato@suse.de,m:samba-technical@lists.samba.org,m:linux-xfs@vger.kernel.org,m:airlied@gmail.com,m:linux-afs@lists.infradead.org,m:simona@ffwll.ch,m:linux-cifs@vger.kernel.org,m:linux-nil
 fs@vger.kernel.org,m:agruenba@redhat.com,m:mark@fasheh.com,m:zhengqi.arch@bytedance.com,m:roman.gushchin@linux.dev,m:Dai.Ngo@oracle.com,m:tursulin@ursulin.net,m:jgg@ziepe.ca,m:slava@dubeyko.com,m:ziy@nvidia.com,m:neil@brown.name,m:axelrasmussen@google.com,m:idryomov@gmail.com,m:linux-ext4@vger.kernel.org,m:weixugc@google.com,m:sprasad@microsoft.com,m:okorniev@redhat.com,m:anna@kernel.org,m:jannh@google.com,m:jhubbard@nvidia.com,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:cgroups@vger.kernel.org,m:mripard@kernel.org,m:tom@talpey.com,m:ocfs2-devel@lists.linux.dev,m:bharathsm@microsoft.com,m:jlbec@evilplan.org,m:ronniesahlberg@gmail.com,m:rodrigo.vivi@intel.com,m:dsterba@suse.com,m:shakeel.butt@linux.dev,m:ceph-devel@vger.kernel.org,m:konishi.ryusuke@gmail.com,m:osalvador@suse.de,m:jani.nikula@linux.intel.com,m:gfs2@lists.linux.dev,m:linux-nfs@vger.kernel.org,m:baolin.wang@linux.alibaba.com,m:joseph.qi@linux.alibaba.com,m:dri-devel@lists.freedesktop.org,m:mu
 chun.song@linux.dev,m:jlayton@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:chuck.lever@oracle.com,m:linux-btrfs@vger.kernel.org,m:tzimmermann@suse.de,m:hannes@cmpxchg.org,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:jackmanb@google.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tz2294@columbia.edu,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_TO(0.00)[redhat.com,auristor.com,kernel.org,linux-foundation.org,oracle.com,google.com,suse.com,tencent.com,huaweicloud.com,gmail.com,infradead.org,intel.com,suse.cz,zeniv.linux.org.uk,mit.edu];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,columbia.edu:s=pps01];
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
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 065EF19EFB7
X-Rspamd-Action: no action

Remove unused pagevec.h includes from .c files. These were found with
the following command:

  grep -rl '#include.*pagevec\.h' --include='*.c' | while read f; do
  	grep -qE 'PAGEVEC_SIZE|folio_batch' "$f" || echo "$f"
  done

There are probably more removal candidates in .h files, but those are
more complex to analyze.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/afs/write.c                   | 1 -
 fs/dax.c                         | 1 -
 fs/ext4/file.c                   | 1 -
 fs/ext4/page-io.c                | 1 -
 fs/ext4/readpage.c               | 1 -
 fs/f2fs/file.c                   | 1 -
 fs/mpage.c                       | 1 -
 fs/netfs/buffered_write.c        | 1 -
 fs/nfs/blocklayout/blocklayout.c | 1 -
 fs/nfs/dir.c                     | 1 -
 fs/ocfs2/refcounttree.c          | 1 -
 fs/smb/client/connect.c          | 1 -
 fs/smb/client/file.c             | 1 -
 13 files changed, 13 deletions(-)

diff --git a/fs/afs/write.c b/fs/afs/write.c
index 93ad86ff3345..fcfed9d24e0a 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -10,7 +10,6 @@
 #include <linux/fs.h>
 #include <linux/pagemap.h>
 #include <linux/writeback.h>
-#include <linux/pagevec.h>
 #include <linux/netfs.h>
 #include <trace/events/netfs.h>
 #include "internal.h"
diff --git a/fs/dax.c b/fs/dax.c
index b78cff9c91b3..a5237169b467 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -15,7 +15,6 @@
 #include <linux/memcontrol.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
-#include <linux/pagevec.h>
 #include <linux/sched.h>
 #include <linux/sched/signal.h>
 #include <linux/uio.h>
diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index f1dc5ce791a7..5e02f6cf653e 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -27,7 +27,6 @@
 #include <linux/dax.h>
 #include <linux/filelock.h>
 #include <linux/quotaops.h>
-#include <linux/pagevec.h>
 #include <linux/uio.h>
 #include <linux/mman.h>
 #include <linux/backing-dev.h>
diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index a8c95eee91b7..98da200d11c8 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -16,7 +16,6 @@
 #include <linux/string.h>
 #include <linux/buffer_head.h>
 #include <linux/writeback.h>
-#include <linux/pagevec.h>
 #include <linux/mpage.h>
 #include <linux/namei.h>
 #include <linux/uio.h>
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index 830f3b8a321f..3c7aabde719c 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -43,7 +43,6 @@
 #include <linux/mpage.h>
 #include <linux/writeback.h>
 #include <linux/backing-dev.h>
-#include <linux/pagevec.h>
 
 #include "ext4.h"
 #include <trace/events/ext4.h>
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index c8a2f17a8f11..c6b6a1465d08 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -17,7 +17,6 @@
 #include <linux/compat.h>
 #include <linux/uaccess.h>
 #include <linux/mount.h>
-#include <linux/pagevec.h>
 #include <linux/uio.h>
 #include <linux/uuid.h>
 #include <linux/file.h>
diff --git a/fs/mpage.c b/fs/mpage.c
index 7dae5afc2b9e..e5285fbfcf09 100644
--- a/fs/mpage.c
+++ b/fs/mpage.c
@@ -28,7 +28,6 @@
 #include <linux/mm_inline.h>
 #include <linux/writeback.h>
 #include <linux/backing-dev.h>
-#include <linux/pagevec.h>
 #include "internal.h"
 
 /*
diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 22a4d61631c9..05ea5b0cc0e8 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -10,7 +10,6 @@
 #include <linux/mm.h>
 #include <linux/pagemap.h>
 #include <linux/slab.h>
-#include <linux/pagevec.h>
 #include "internal.h"
 
 static void __netfs_set_group(struct folio *folio, struct netfs_group *netfs_group)
diff --git a/fs/nfs/blocklayout/blocklayout.c b/fs/nfs/blocklayout/blocklayout.c
index cb0a645aeb50..11f9f69cde61 100644
--- a/fs/nfs/blocklayout/blocklayout.c
+++ b/fs/nfs/blocklayout/blocklayout.c
@@ -36,7 +36,6 @@
 #include <linux/namei.h>
 #include <linux/bio.h>		/* struct bio */
 #include <linux/prefetch.h>
-#include <linux/pagevec.h>
 
 #include "../pnfs.h"
 #include "../nfs4session.h"
diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index 2402f57c8e7d..0d276441206b 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -32,7 +32,6 @@
 #include <linux/nfs_fs.h>
 #include <linux/nfs_mount.h>
 #include <linux/pagemap.h>
-#include <linux/pagevec.h>
 #include <linux/namei.h>
 #include <linux/mount.h>
 #include <linux/swap.h>
diff --git a/fs/ocfs2/refcounttree.c b/fs/ocfs2/refcounttree.c
index c1cdececdfa4..b4acd081bbc4 100644
--- a/fs/ocfs2/refcounttree.c
+++ b/fs/ocfs2/refcounttree.c
@@ -31,7 +31,6 @@
 #include <linux/blkdev.h>
 #include <linux/slab.h>
 #include <linux/writeback.h>
-#include <linux/pagevec.h>
 #include <linux/swap.h>
 #include <linux/security.h>
 #include <linux/string.h>
diff --git a/fs/smb/client/connect.c b/fs/smb/client/connect.c
index 33dfe116ca52..9e57812b7b95 100644
--- a/fs/smb/client/connect.c
+++ b/fs/smb/client/connect.c
@@ -20,7 +20,6 @@
 #include <linux/delay.h>
 #include <linux/completion.h>
 #include <linux/kthread.h>
-#include <linux/pagevec.h>
 #include <linux/freezer.h>
 #include <linux/namei.h>
 #include <linux/uuid.h>
diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index 18f31d4eb98d..853ce1817810 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -15,7 +15,6 @@
 #include <linux/stat.h>
 #include <linux/fcntl.h>
 #include <linux/pagemap.h>
-#include <linux/pagevec.h>
 #include <linux/writeback.h>
 #include <linux/task_io_accounting_ops.h>
 #include <linux/delay.h>

-- 
2.39.5



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
