Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDrkJIeJn2mmcgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 00:45:11 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0F219EFCF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 00:45:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:In-Reply-To:References:Message-Id:MIME-Version:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LDi+mEnzWdoiq6CkOCT66a+iGtrrd15ROshLtBdd4o=; b=jnL+eIus/iq2lff2GrjD+WIy1B
	zK4d5Q67/s3xVA5EA+VGFBQk6e1s4L0dSYMG1pWpcIeR8gwCPdm5rvOYH6xfgYGEPe/AKQ+zUuDpW
	kPWnje1KEOtoz3dIRuQ4eoACU7/GaXCfyh0X9MRzZeF8kZUrwfU9abVMWnvI3oTcQWGQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvOZ3-0006zo-E4;
	Wed, 25 Feb 2026 23:45:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tz2294@columbia.edu>) id 1vvOZ0-0006zK-QZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Feb 2026 23:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TE8ZhYBQf9fiNswnOLiD0snqyySTRxN7Ufk+GD8fw6E=; b=awPOTZ/tK2WbaO20RebX2GHldT
 DM9F+puqld4ZRBfSbw9qu9cdTIeDWD30mhNCrKnA61SyDyodMcw+/DNM92Q3z9e0TtlNanzwiAvYx
 X60DTUlTtNfisdVjqBsqQiuJVgVDHrosVNwGdceqFkZlCteKEyBFM6de0rSzt03Z8Fp0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TE8ZhYBQf9fiNswnOLiD0snqyySTRxN7Ufk+GD8fw6E=; b=BzUi7OmQeCSo6tFiJd6927ju2/
 uXP94SfSaEACcfLep0P9gSKtnEJw9Nty73j/DdPttArOrZe60xGEYzLD2httJdnGdVJGTSPt1460P
 zHAWfOzTOjJ3dSVjb0JtQcwqn0oxTbRbN0/I3Rmr7GNzFLYo8zDxjPU9B9tQzOw7Spc0=;
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvOYv-00017j-Vl for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Feb 2026 23:45:02 +0000
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
 by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61PNN7Fo1399562
 for <linux-f2fs-devel@lists.sourceforge.net>; Wed, 25 Feb 2026 18:44:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pps01; bh=TE8Z
 hYBQf9fiNswnOLiD0snqyySTRxN7Ufk+GD8fw6E=; b=b/yB3FO8kwgXmET281Jv
 XP+tAXlRZIOQ6OAFR2YSS+792EIr83nP+nakYz8tKWh86IL9kbOyLkg2yn8b3g/q
 S5VPNh8sAcmAlprkg2Cw/wyQbawj3NLSALIkGLq2K8V4kIRt4aYXHS/DHlGsM8fs
 H8cCC3+JhbwQsrjnzdcgeRxONcJg4TG6TN/qWF72MSX7O8ZGhKSU3I2BfZEDoisK
 t1LvqQr0puhEkmBwjqopiEjNDjB9vH7tXsjnfmo+oQfclWfz01qggxeWH6r8fgsq
 rZ0/3X3DzNuyvGFcD+vq2Q7XNExoHO+FQm1lfYBwrgA16DwNSuwMZae97gH/dVl+
 jg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4chx6v6bcb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Feb 2026 18:44:51 -0500 (EST)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-506afabb8d3so99287031cf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Feb 2026 15:44:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772063090; x=1772667890;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TE8ZhYBQf9fiNswnOLiD0snqyySTRxN7Ufk+GD8fw6E=;
 b=G8Bk+45xpWS0Ig/6IUu57/fNjrPJW/BZFWlxISmK+QTkDm8mP3AmTIixE17V8e1dN2
 UFQUc0znLKAP2r6shO+sDmKcmDal+fuKPNBr0Kf8pA52FGye+92mQKxZVP+SMZJaVMV1
 I7VltG/hh33oA7frjA7SDO0e8Z3zkLdjL9WLL/S9UP9PTSBtz8U7kofct0JsTE1IF8pS
 C821HIkvsgo6yegFFaZsM/eeyryY9DCBnmaUXSy7tR4CFCinT84wlNCqn/brREoQ1Ph6
 H3w2mOF8aEdrBAt1eW9u8j8MMENMwVLNX6CIWbI7rLdrjHFWe44wHcoRjSDN2b+2Smi9
 oCOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfljZ+PFgQgvD/xB+cIxskarqV2UqhIGqnfDNt5qm586QggBLV1TLCd4jskTmy6gLWcvoKykAiaAGyZOsDu2Vw@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwdN4PoWtJH6qY5EMNFB0ybBWDmPC8QtKwAZualSQ9huZAraLIw
 6eBeCGtJOTn98nldNAJmVRPQ8jqA8nmOAswVf0j089itZKBxZ+0nACjbqYHYfV4IuVmEuj8ubuj
 rhu2FwMmuBB1W4M5tDhzjJwa/vRySonK9v+qN8anwrp5SCFuaGSkhuE8rRtIiYkHWfJiQkAVwLx
 U=
X-Gm-Gg: ATEYQzzRjqS/NN6Tpudwmcigwp9z5nszUI3qp/D/oFwYU271R2QR6Tv79usvoEQYNwh
 A4F4Qrk+8wRZ9lSm9Jpel+v9hORCnOfUINSBnoySUO8R5unfqLIJL0RNVjYg8qc6U3RcFZ5nvUT
 0ueYb9uk/Q5946EqDp6dIZBpe8c1jQPQqna8wbcRbbNqYTykv3hYnr7tfj8qRdU2DzZVAoHW5v3
 P+w+fcZA9nDBfDOGOZsju/gKTieL5JESwf97PmQ2Ee262YbcM+FIyMzaMFAMy0CafH9kWuhk9Tr
 Kp1+TeGrWTiWw1flTkAVXmor5V/YrkdUSgqDB3cB/UfosM9x3PAsdSuW+nvvHUwhP8IgFMJcNQn
 VKoYhGaimpxmHljWkjLYPNFrRlDlcYP5p
X-Received: by 2002:ac8:5ac5:0:b0:503:2fe5:f380 with SMTP id
 d75a77b69052e-507441df64fmr13263061cf.0.1772063090007; 
 Wed, 25 Feb 2026 15:44:50 -0800 (PST)
X-Received: by 2002:ac8:5ac5:0:b0:503:2fe5:f380 with SMTP id
 d75a77b69052e-507441df64fmr13262341cf.0.1772063089401; 
 Wed, 25 Feb 2026 15:44:49 -0800 (PST)
Received: from [127.0.1.1] ([216.158.158.246])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-899c738d80bsm3357606d6.41.2026.02.25.15.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 15:44:49 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 25 Feb 2026 18:44:28 -0500
MIME-Version: 1.0
Message-Id: <20260225-pagevec_cleanup-v2-4-716868cc2d11@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772063077; l=5814;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=zO7GBjiuOn5Q+h+zA8UgP1+Klsw8MQQTt1O0svxg4WA=;
 b=KCL19WgRUDAqH63IGvAc3KncLR0mQnluCE5DMTx+wx8s1EMvm5gWiID7it4982lNgTaHXaECH
 ClIpdW+IjPxAETpUADJ+80YGkvu3AQ4uNneZg/M0Lj8/3I89nOh73yK
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: Xemm51k-o3HI1l2617zQe-VGf4hKZE8R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDIyNyBTYWx0ZWRfX5AImztvjXnxz
 NgrodDJ8dUalWnJUAYQVpQFq344yAnnidB75uTMyUgDb1SBOZYusCW6cU7g+L2MC0QcgUst8Net
 fVY14LQnqW+qlXkG+25MAgUmiEwDsX8pHD8eZ7vY7MhM/IocwGToumvAKVR9fxmR0eQxRSx5YES
 Ac1OI/Q3Ql5enTebgexREVQUqXK127Czg+O5f2wy3GpO9k/UO6jazFSlLufFoEZ10I0MtdIaf4K
 l7i3Qd5EFL3Xrhidf8NCxcQLTI92UZ7zu1znqU2/jiEa/wz4ByEih9u8dN8g3ebA6CzlTDbttIA
 YCpZ1RO9W1GwOTKUReqrrzZ8XAK6CiAAnfOrxeSxZsE3pPSiZhMhlRehNRzSOKE8j+jADoHubk2
 2qskvGA5lpurD0+gLb/e0QFMYEtZJ7S+ek2a1gAh1sMAO1ANogVqz9zkFPFpOk3hOMe9A0L2yYj
 55s/Y2Di/wv52ppyH3w==
X-Authority-Analysis: v=2.4 cv=FqMIPmrq c=1 sm=1 tr=0 ts=699f8973 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=mD05b5UW6KhLIDvowZ5dSQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=x7bEGLp0ZPQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=960X5KZuJcz03JLduyoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Xemm51k-o3HI1l2617zQe-VGf4hKZE8R
X-Proofpoint-Virus-Version: vendor=nai engine=6800 definitions=11712
 signatures=596818
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=10
 spamscore=0 bulkscore=10 lowpriorityscore=10 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250227
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: struct pagevec no longer exists. Rename the macro
 appropriately.
 Signed-off-by: Tal Zussman <tz2294@columbia.edu> --- fs/btrfs/extent_io.c
 | 4 ++-- include/linux/folio_batch.h | 6 +++--- include/linux/folio_queue.h
 | 6 +++--- mm/shmem.c | 4 ++-- mm/swap.c | 2 +- mm [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [148.163.135.74 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1vvOYv-00017j-Vl
Subject: [f2fs-dev] [PATCH v2 4/4] folio_batch: Rename PAGEVEC_SIZE to
 FOLIO_BATCH_SIZE
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
X-Rspamd-Queue-Id: BE0F219EFCF
X-Rspamd-Action: no action

struct pagevec no longer exists. Rename the macro appropriately.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/extent_io.c        | 4 ++--
 include/linux/folio_batch.h | 6 +++---
 include/linux/folio_queue.h | 6 +++---
 mm/shmem.c                  | 4 ++--
 mm/swap.c                   | 2 +-
 mm/swap_state.c             | 2 +-
 mm/truncate.c               | 6 +++---
 7 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index c373d113f1e7..d82ca509503f 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -2095,13 +2095,13 @@ static void buffer_tree_tag_for_writeback(struct btrfs_fs_info *fs_info,
 struct eb_batch {
 	unsigned int nr;
 	unsigned int cur;
-	struct extent_buffer *ebs[PAGEVEC_SIZE];
+	struct extent_buffer *ebs[FOLIO_BATCH_SIZE];
 };
 
 static inline bool eb_batch_add(struct eb_batch *batch, struct extent_buffer *eb)
 {
 	batch->ebs[batch->nr++] = eb;
-	return (batch->nr < PAGEVEC_SIZE);
+	return (batch->nr < FOLIO_BATCH_SIZE);
 }
 
 static inline void eb_batch_init(struct eb_batch *batch)
diff --git a/include/linux/folio_batch.h b/include/linux/folio_batch.h
index a2f3d3043f7e..b45946adc50b 100644
--- a/include/linux/folio_batch.h
+++ b/include/linux/folio_batch.h
@@ -12,7 +12,7 @@
 #include <linux/types.h>
 
 /* 31 pointers + header align the folio_batch structure to a power of two */
-#define PAGEVEC_SIZE	31
+#define FOLIO_BATCH_SIZE	31
 
 struct folio;
 
@@ -29,7 +29,7 @@ struct folio_batch {
 	unsigned char nr;
 	unsigned char i;
 	bool percpu_pvec_drained;
-	struct folio *folios[PAGEVEC_SIZE];
+	struct folio *folios[FOLIO_BATCH_SIZE];
 };
 
 /**
@@ -58,7 +58,7 @@ static inline unsigned int folio_batch_count(const struct folio_batch *fbatch)
 
 static inline unsigned int folio_batch_space(const struct folio_batch *fbatch)
 {
-	return PAGEVEC_SIZE - fbatch->nr;
+	return FOLIO_BATCH_SIZE - fbatch->nr;
 }
 
 /**
diff --git a/include/linux/folio_queue.h b/include/linux/folio_queue.h
index 0d3765fa9d1d..f6d5f1f127c9 100644
--- a/include/linux/folio_queue.h
+++ b/include/linux/folio_queue.h
@@ -29,12 +29,12 @@
  */
 struct folio_queue {
 	struct folio_batch	vec;		/* Folios in the queue segment */
-	u8			orders[PAGEVEC_SIZE]; /* Order of each folio */
+	u8			orders[FOLIO_BATCH_SIZE]; /* Order of each folio */
 	struct folio_queue	*next;		/* Next queue segment or NULL */
 	struct folio_queue	*prev;		/* Previous queue segment of NULL */
 	unsigned long		marks;		/* 1-bit mark per folio */
 	unsigned long		marks2;		/* Second 1-bit mark per folio */
-#if PAGEVEC_SIZE > BITS_PER_LONG
+#if FOLIO_BATCH_SIZE > BITS_PER_LONG
 #error marks is not big enough
 #endif
 	unsigned int		rreq_id;
@@ -70,7 +70,7 @@ static inline void folioq_init(struct folio_queue *folioq, unsigned int rreq_id)
  */
 static inline unsigned int folioq_nr_slots(const struct folio_queue *folioq)
 {
-	return PAGEVEC_SIZE;
+	return FOLIO_BATCH_SIZE;
 }
 
 /**
diff --git a/mm/shmem.c b/mm/shmem.c
index 149fdb051170..5e7dcf5bc5d3 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1113,7 +1113,7 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, uoff_t lend,
 	pgoff_t start = (lstart + PAGE_SIZE - 1) >> PAGE_SHIFT;
 	pgoff_t end = (lend + 1) >> PAGE_SHIFT;
 	struct folio_batch fbatch;
-	pgoff_t indices[PAGEVEC_SIZE];
+	pgoff_t indices[FOLIO_BATCH_SIZE];
 	struct folio *folio;
 	bool same_folio;
 	long nr_swaps_freed = 0;
@@ -1510,7 +1510,7 @@ static int shmem_unuse_inode(struct inode *inode, unsigned int type)
 	struct address_space *mapping = inode->i_mapping;
 	pgoff_t start = 0;
 	struct folio_batch fbatch;
-	pgoff_t indices[PAGEVEC_SIZE];
+	pgoff_t indices[FOLIO_BATCH_SIZE];
 	int ret = 0;
 
 	do {
diff --git a/mm/swap.c b/mm/swap.c
index 2e517ede6561..78b4aa811fc6 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -1018,7 +1018,7 @@ EXPORT_SYMBOL(folios_put_refs);
 void release_pages(release_pages_arg arg, int nr)
 {
 	struct folio_batch fbatch;
-	int refs[PAGEVEC_SIZE];
+	int refs[FOLIO_BATCH_SIZE];
 	struct encoded_page **encoded = arg.encoded_pages;
 	int i;
 
diff --git a/mm/swap_state.c b/mm/swap_state.c
index a0c64db2b275..6313b59d7eab 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -385,7 +385,7 @@ void free_folio_and_swap_cache(struct folio *folio)
 void free_pages_and_swap_cache(struct encoded_page **pages, int nr)
 {
 	struct folio_batch folios;
-	unsigned int refs[PAGEVEC_SIZE];
+	unsigned int refs[FOLIO_BATCH_SIZE];
 
 	folio_batch_init(&folios);
 	for (int i = 0; i < nr; i++) {
diff --git a/mm/truncate.c b/mm/truncate.c
index df0b7a7e6aff..2931d66c16d0 100644
--- a/mm/truncate.c
+++ b/mm/truncate.c
@@ -369,7 +369,7 @@ void truncate_inode_pages_range(struct address_space *mapping,
 	pgoff_t		start;		/* inclusive */
 	pgoff_t		end;		/* exclusive */
 	struct folio_batch fbatch;
-	pgoff_t		indices[PAGEVEC_SIZE];
+	pgoff_t		indices[FOLIO_BATCH_SIZE];
 	pgoff_t		index;
 	int		i;
 	struct folio	*folio;
@@ -534,7 +534,7 @@ EXPORT_SYMBOL(truncate_inode_pages_final);
 unsigned long mapping_try_invalidate(struct address_space *mapping,
 		pgoff_t start, pgoff_t end, unsigned long *nr_failed)
 {
-	pgoff_t indices[PAGEVEC_SIZE];
+	pgoff_t indices[FOLIO_BATCH_SIZE];
 	struct folio_batch fbatch;
 	pgoff_t index = start;
 	unsigned long ret;
@@ -672,7 +672,7 @@ int folio_unmap_invalidate(struct address_space *mapping, struct folio *folio,
 int invalidate_inode_pages2_range(struct address_space *mapping,
 				  pgoff_t start, pgoff_t end)
 {
-	pgoff_t indices[PAGEVEC_SIZE];
+	pgoff_t indices[FOLIO_BATCH_SIZE];
 	struct folio_batch fbatch;
 	pgoff_t index;
 	int i;

-- 
2.39.5



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
