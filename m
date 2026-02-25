Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aK5HBnyJn2mmcgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 00:45:00 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EDB19EFA7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 00:44:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:In-Reply-To:References:Message-Id:MIME-Version:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rA66sTW1II56U7Adkkek5DVq9D29D2+xPvgHdk5FI0A=; b=ej6hDaO19cF7+ngZn3shYfJ/nt
	Ho0zWQPgPJpEOaPMAMHnIEiyhjlHhliwTFeeKyU17nwrlyjaJ6UXC9wuCkW1Xx1QdAZ2MyspDCJXM
	zIRthoB0LeKDBgaVaHTqzNopruwuYRYsGDZMz/06THASWvspDRkJ1KNbcqgCikOgKyf8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvOYl-0001x9-Pq;
	Wed, 25 Feb 2026 23:44:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tz2294@columbia.edu>) id 1vvOYj-0001x2-Qx
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Feb 2026 23:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QbU8qIjBMGeq/4CCh33jplvuFV4mV/Z7tLyPGzkrhRQ=; b=DsNCBKTf6BgvLaPc38+LVlqHAd
 ssh/r1ZnFHVWlmrGJT2QyQ7rM1RDZu1kVenTGD68HW5lfrhy8QegiIT+VF0H+62o6575r6iK+ll6Z
 ad4rK2kGse3NJfz6wIZHVF+YoBv8KkjBm6BDWjphoNjm61sMlAKxW6hzpKmo8hoRC5lM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QbU8qIjBMGeq/4CCh33jplvuFV4mV/Z7tLyPGzkrhRQ=; b=KsVR00Gqhp5wqI8M9REcEwZIho
 tvSpO3+cm8jJyXypI08sqLkXHpkDDdfQIWNmCQSs9SBZS6MsPeFBhFaIA9ymgiX7n2JVtj2AMY0in
 AVKE4nlPiwnvP/LmPl1i5FDJM4VJhmg7eHd3Tn3umDX5x4BdMfEDz9L/OxOv9YOqeLCQ=;
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvOYj-000173-AF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Feb 2026 23:44:50 +0000
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
 by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61PNNHvv241013
 for <linux-f2fs-devel@lists.sourceforge.net>; Wed, 25 Feb 2026 18:44:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pps01; bh=QbU8
 qIjBMGeq/4CCh33jplvuFV4mV/Z7tLyPGzkrhRQ=; b=k8p8qfY6LKJTKzyyIu1T
 MBHAySeSL2rGW18v7FXhhfE5FBzkAnsvzwwdn7GkjnE3GX/FS+1Labq+PlugfXXz
 vOec7glehBd8/aUWG3kwI+2K7MIntwvnNxIlbXeb4MC2Iz8OIYCgGdmmdQomMWcR
 jawfPFhJyFIek32736qXfJ1Zsf8PihQodtpVLS4wPMGxrg7MiHzMTOTAz5tsZHSw
 kZ64SjLH0jiAaG/crVhQ9y25MdtNe8NaKVc7DRq0nHaElnWsMUg1K68u6t5fD41K
 7efzQ1T71c41RoTR8AQXiabnd0+DiFVVEkIL0sRUwP2Sy7x2D3aUqGREmAiKw7yl
 /g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4chr4p7jc7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Feb 2026 18:44:43 -0500 (EST)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb52a9c0eeso251318785a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Feb 2026 15:44:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772063083; x=1772667883;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QbU8qIjBMGeq/4CCh33jplvuFV4mV/Z7tLyPGzkrhRQ=;
 b=obX8TaH7bXJeRgLTItYjClE6mA895JyIq2Z27xx8anlDDvNiSHPS/bsela0R8J6h7m
 fA1tDwH/tkEkYZRRvYUpL87obxUvVwDzlTrojgt8gpBzhAOpjkrifbvAoxyYYP6XV/NT
 Y0C24PKfzI6PMzV7ZakVFbsfQBEpx0OTOh+3hgSMWeKMXpbbhRIWuUDF2CtQd/A7844/
 7ZS4za64cVe7xc8V/xOLn5RH/g8bEBiCfG50oYyqUdTyGQr/cQZgAkxLpoFCB3vpTb5K
 K11eHD8QLA7ZdnQFxe83vS3gAQYo8tJQwBh7N93aFVOh1ts+f/wnv0TVS0+WpxWWM5lY
 9Y9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU7EvMQx8qeNqgeyJoOfsvCN++F3cH3eFy9ysRiUl45In3Xjpr+XxdW+2oD1Ptg5egtx9bbgTVWmu2eLszYvBh@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzDcckWjUVszcEVuns8YVh8JHWjBa5JyCR/dscc8sX9m7OLVZZp
 BpojUa4nJZuUp/QI3+Sh93dSKPq7FROF5CvxQWZqOg6cvrWlS8diOp8QPKRpOE1QVhcv1FgpbgU
 m12CpTcJAhDRa+vn6S/MH/brkTWwoLXNie+6IEkLVz7fgpF0Hwjz5qsiukJkJvlwmyAecbZjppu
 0=
X-Gm-Gg: ATEYQzz4c3G/jYHlaN/N1ACBTZPjRsAQMKLCx5BjvGGFXz4lmXW4SaMSnoxRCpn44kW
 wLgXAixYHECS2fyWM01ny5E0DMAbrQHav/TrtPBbkzIU0OC2t4WYOQm68hq1jgVBbBuQge3ddBf
 nlCBdIzrha0nh1JJ/ghHDTnMzv57O+3dmRzU6FeHIQbVEMZ8one1URSaQ0agKpFhjjRdy+89rr3
 Qc8gUXgooCzHUZDQjPQ7/1S1mFVVY847ylqdBTY8PwBYf77qhZFvEOomvcVfy78zYeJJdjT6SrC
 gaB4oPd3OOVKcf4Md0AkDyYaYjnk8k9flnc0oH3IZ6MvLLOV6OIad1JSK+puFOaK4X69cxgOEgG
 ScFl0aeTuBUw5gFypjukk/4O0YESahFIZ
X-Received: by 2002:a05:620a:bc6:b0:8cb:50d6:18be with SMTP id
 af79cd13be357-8cbbcf5fcf3mr351659185a.18.1772063082621; 
 Wed, 25 Feb 2026 15:44:42 -0800 (PST)
X-Received: by 2002:a05:620a:bc6:b0:8cb:50d6:18be with SMTP id
 af79cd13be357-8cbbcf5fcf3mr351647085a.18.1772063081985; 
 Wed, 25 Feb 2026 15:44:41 -0800 (PST)
Received: from [127.0.1.1] ([216.158.158.246])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-899c738d80bsm3357606d6.41.2026.02.25.15.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 15:44:41 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 25 Feb 2026 18:44:25 -0500
MIME-Version: 1.0
Message-Id: <20260225-pagevec_cleanup-v2-1-716868cc2d11@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772063077; l=2123;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=86tTrdoOnAn/xo3cekp1XuyRqb4HRFNzoiKbv0I1ps4=;
 b=0ov9kj7XAzT78Flm+u7++Q86OOmjR2OlGmMBdpiKWPN48FTWijPSg85hjs6TZBPJjXCzDYWnL
 klFYhD+F1AcALAkegHF4EiMet5ndziKuMEd8gAJMsRTj0W6VnFL6fSO
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDIyNyBTYWx0ZWRfX9pXaQINK6Y9R
 wjdjCK+woSj1mW/ozh1dMf6RGqBtS9RU+40FAejnt8TBLVRG7uOYKJf2u47xBDMyFHKwkAaHFV1
 5JzZnQH5F1Z/elx94IOGc23YpVD8nGMSfSdvTPh7/CDM1YhjsHse9xi7lJK0TJjqAerXNXfXEsL
 KLopcKLVwXego/5anBagrlqIRhbWB2gZ1K7BrUQ76i9AvnscQl+P4HZ5ts6RuMbDfrfTDSB+rpm
 S5BVtrMhoEXmiZGa4lJEshu3AK3nogwRmzE3UsDtOQPFxP5Vzqpgr7SCypcb8cCg+sAZdt0U6DJ
 kCgrSp3RCRnwyZadhXK69xwuI74uXXq+EQ5GjxEf6OpFlTjjDfsKhj9RSu91xQA04TdZ5vu5CqK
 59eYgBC5F2s3VzLNum8+eqwIoOlUbEY2dnUN0dLGfHWSDUmmdq/xJqz6r94b3znCSGA0oJJQq5Z
 qSC6m0VFUgXgOi/0f2g==
X-Authority-Analysis: v=2.4 cv=IYGKmGqa c=1 sm=1 tr=0 ts=699f896b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=mD05b5UW6KhLIDvowZ5dSQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=x7bEGLp0ZPQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=KlNbpEHeXbYZISPg4o8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: L0sXVzDunk3w1j7xDiX54mrE7NS0sdDa
X-Proofpoint-GUID: L0sXVzDunk3w1j7xDiX54mrE7NS0sdDa
X-Proofpoint-Virus-Version: vendor=nai engine=6800 definitions=11712
 signatures=596818
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=10 bulkscore=10 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250227
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: struct pagevec was removed in commit 1e0877d58b1e ("mm:
 remove
 struct pagevec"). Remove remaining forward declarations and change
 __folio_batch_release()'s
 declaration to match its definition. Reviewed-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
 Acked-by: Chris Li <chrisl@kernel.org> Signed-off-by: Tal Zussman
 <tz2294@columbia.edu> [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1vvOYj-000173-AF
Subject: [f2fs-dev] [PATCH v2 1/4] mm: Remove stray references to struct
 pagevec
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
	NEURAL_HAM(-0.00)[-0.993];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F3EDB19EFA7
X-Rspamd-Action: no action

struct pagevec was removed in commit 1e0877d58b1e ("mm: remove struct
pagevec"). Remove remaining forward declarations and change
__folio_batch_release()'s declaration to match its definition.

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Acked-by: Chris Li <chrisl@kernel.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/afs/internal.h       | 1 -
 fs/f2fs/f2fs.h          | 2 --
 include/linux/pagevec.h | 2 +-
 include/linux/swap.h    | 2 --
 4 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 009064b8d661..599353c33337 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -31,7 +31,6 @@
 
 #define AFS_CELL_MAX_ADDRS 15
 
-struct pagevec;
 struct afs_call;
 struct afs_vnode;
 struct afs_server_probe;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bb34e864d0ef..d9e8531a5301 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -28,8 +28,6 @@
 #include <linux/fscrypt.h>
 #include <linux/fsverity.h>
 
-struct pagevec;
-
 #ifdef CONFIG_F2FS_CHECK_FS
 #define f2fs_bug_on(sbi, condition)	BUG_ON(condition)
 #else
diff --git a/include/linux/pagevec.h b/include/linux/pagevec.h
index 63be5a451627..007affabf335 100644
--- a/include/linux/pagevec.h
+++ b/include/linux/pagevec.h
@@ -93,7 +93,7 @@ static inline struct folio *folio_batch_next(struct folio_batch *fbatch)
 	return fbatch->folios[fbatch->i++];
 }
 
-void __folio_batch_release(struct folio_batch *pvec);
+void __folio_batch_release(struct folio_batch *fbatch);
 
 static inline void folio_batch_release(struct folio_batch *fbatch)
 {
diff --git a/include/linux/swap.h b/include/linux/swap.h
index 0effe3cc50f5..4b1f13b5bbad 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -20,8 +20,6 @@ struct notifier_block;
 
 struct bio;
 
-struct pagevec;
-
 #define SWAP_FLAG_PREFER	0x8000	/* set if swap priority specified */
 #define SWAP_FLAG_PRIO_MASK	0x7fff
 #define SWAP_FLAG_DISCARD	0x10000 /* enable discard for swap */

-- 
2.39.5



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
