Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLUOE8JIoGlzhwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 14:21:06 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ABD1A650F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 14:21:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERZ8sWUSQM85jFTu/2w5gQoJg1aZla/RADc9hbNeEmc=; b=S0/dHZ77X+wTd4ZKq4QClSj0it
	aesDMYOmskcY6RwsHQ++wiSOh4v55RXgYxUddCvEQSSaKYHqCQidVEn4MCeL4B8RGlp2JYalvd4EC
	319ujkMOQPeGTmu6uEg87U48qdftOc746Qaf68JZdndgjIzwlkNKMUEG/jVDbIvdB+1A=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvbIa-0008Ce-K8;
	Thu, 26 Feb 2026 13:21:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@kernel.org>) id 1vvbIZ-0008CY-1C
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 13:20:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2dYUHTgHZPcS8LtYadR76DcINWvPYrQDrJqg3xx3k/I=; b=Z6Djd0czasj+Tj1LFez6lRLmzb
 XfdJVaTxvp3x0IIdIbguHZXrZUFJnp+PmqfLEOTBkXStOuzNwAfgrau+icIm2eMyPjh0YXINKK8T4
 bppda/2orT+gH3iRAtBPWsbMO1j0onepotPkl2tHbf+klZce2r/w+KIHuWlY5WT4SXaI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2dYUHTgHZPcS8LtYadR76DcINWvPYrQDrJqg3xx3k/I=; b=EnKI8/qmq9fqtAMSyQ6UbslEWU
 nkff1XJKioaar5TYusZXUpfsfe8Li+Rk3xTZxPJodU9v+3vqdfH9geQivBBOfe5XexSujIaPR3sPl
 4EH0Np5e19BEI1B1Js9Z1Cla/J0FvEvtG4j96GLDJlCjnnMRZOExFoo6r+jO7HQNZ8q4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvbIY-0001uT-Kg for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 13:20:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2F3D040DA4;
 Thu, 26 Feb 2026 13:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEDABC19422;
 Thu, 26 Feb 2026 13:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772112048;
 bh=kX30qZnPYCqfXb/76euKMO+o8GK+nW5VkIoRhP2qqC8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=N4DCZVGHLhr0eBVQJieC3pRRNOvI49z81D2VdJU7sBWh4T/dHMdDAX5hzZ4PpRBNW
 BRAq078+anBNSSCiijh5OkpiqIYJfpx4294YGpYpgaRQbbP8SGLtoBU6rh9a1FWmwg
 SMHRRRvB40cIlPOpE5aMdYx0zO6bkUuB7JQPjuU0GcV+U39Xp9CP5szIB0aKctpq2g
 d+u7N0JiuNZ5PHI+yjzmsfgj+ZfpuRK4a85OFXXDp51NNqss2+suPBeMMB8LBAYrbd
 ueLNudkPWiaIkRW48GLkCxgdEUdzQySHZm0VcoWcIPqzcKgaOeXkBDt5p+PnSlggiO
 a+Pn9fTs5JkzA==
Message-ID: <d8d35cd9-464d-46e5-8da6-cb0e45b1e582@kernel.org>
Date: Thu, 26 Feb 2026 14:20:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tal Zussman <tz2294@columbia.edu>, David Howells <dhowells@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Dan Williams
 <dan.j.williams@intel.com>, Jan Kara <jack@suse.cz>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>
References: <20260225-pagevec_cleanup-v2-0-716868cc2d11@columbia.edu>
 <20260225-pagevec_cleanup-v2-4-716868cc2d11@columbia.edu>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzS5EYXZpZCBIaWxk
 ZW5icmFuZCAoQ3VycmVudCkgPGRhdmlkQGtlcm5lbC5vcmc+wsGQBBMBCAA6AhsDBQkmWAik
 AgsJBBUKCQgCFgICHgUCF4AWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaYJt/AIZAQAKCRBN
 3hD3AP+DWriiD/9BLGEKG+N8L2AXhikJg6YmXom9ytRwPqDgpHpVg2xdhopoWdMRXjzOrIKD
 g4LSnFaKneQD0hZhoArEeamG5tyo32xoRsPwkbpIzL0OKSZ8G6mVbFGpjmyDLQCAxteXCLXz
 ZI0VbsuJKelYnKcXWOIndOrNRvE5eoOfTt2XfBnAapxMYY2IsV+qaUXlO63GgfIOg8RBaj7x
 3NxkI3rV0SHhI4GU9K6jCvGghxeS1QX6L/XI9mfAYaIwGy5B68kF26piAVYv/QZDEVIpo3t7
 /fjSpxKT8plJH6rhhR0epy8dWRHk3qT5tk2P85twasdloWtkMZ7FsCJRKWscm1BLpsDn6EQ4
 jeMHECiY9kGKKi8dQpv3FRyo2QApZ49NNDbwcR0ZndK0XFo15iH708H5Qja/8TuXCwnPWAcJ
 DQoNIDFyaxe26Rx3ZwUkRALa3iPcVjE0//TrQ4KnFf+lMBSrS33xDDBfevW9+Dk6IISmDH1R
 HFq2jpkN+FX/PE8eVhV68B2DsAPZ5rUwyCKUXPTJ/irrCCmAAb5Jpv11S7hUSpqtM/6oVESC
 3z/7CzrVtRODzLtNgV4r5EI+wAv/3PgJLlMwgJM90Fb3CB2IgbxhjvmB1WNdvXACVydx55V7
 LPPKodSTF29rlnQAf9HLgCphuuSrrPn5VQDaYZl4N/7zc2wcWM7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <20260225-pagevec_cleanup-v2-4-716868cc2d11@columbia.edu>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/26/26 00:44,
 Tal Zussman wrote: > struct pagevec no longer
 exists. Rename the macro appropriately. > > Signed-off-by: Tal Zussman
 <tz2294@columbia.edu>
 > --- Acked-by: David Hildenbrand (Arm) <david@kernel.org> 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vvbIY-0001uT-Kg
Subject: Re: [f2fs-dev] [PATCH v2 4/4] folio_batch: Rename PAGEVEC_SIZE to
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
From: "David Hildenbrand \(Arm\) via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "David Hildenbrand \(Arm\)" <david@kernel.org>
Cc: nvdimm@lists.linux.dev, Paulo Alcantara <pc@manguebit.org>,
 Alex Markuze <amarkuze@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>,
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
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tz2294@columbia.edu,m:dhowells@redhat.com,m:marc.dionne@auristor.com,m:jaegeuk@kernel.org,m:chao@kernel.org,m:akpm@linux-foundation.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:baohua@kernel.org,m:willy@infradead.org,m:dan.j.williams@intel.com,m:jack@suse.cz,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:tytso@mit.edu,m:nvdimm@lists.linux.dev,m:pc@manguebit.org,m:amarkuze@redhat.com,m:djwong@kernel.org,m:joonas.lahtinen@linux.intel.com,m:peterx@redhat.com,m:yuanchu@google.com,m:linux-mm@kvack.org,m:clm@fb.com,m:hughd@google.com,m:adilger.kernel@dilger.ca,m:pfalcato@suse.de,m:samba-technical@lists.samba.org,m:linux-xfs@vger.kernel.org,m:airlied@gmail.com,m:linux-afs@lists.infradead.org,m:simona@ffwll.ch,m:linux-cifs@vger.kernel.org,m:linux-nilfs@vger.kernel.org,
 m:agruenba@redhat.com,m:mark@fasheh.com,m:zhengqi.arch@bytedance.com,m:roman.gushchin@linux.dev,m:Dai.Ngo@oracle.com,m:tursulin@ursulin.net,m:jgg@ziepe.ca,m:slava@dubeyko.com,m:ziy@nvidia.com,m:neil@brown.name,m:axelrasmussen@google.com,m:idryomov@gmail.com,m:linux-ext4@vger.kernel.org,m:weixugc@google.com,m:sprasad@microsoft.com,m:okorniev@redhat.com,m:anna@kernel.org,m:jannh@google.com,m:jhubbard@nvidia.com,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:cgroups@vger.kernel.org,m:mripard@kernel.org,m:tom@talpey.com,m:ocfs2-devel@lists.linux.dev,m:bharathsm@microsoft.com,m:jlbec@evilplan.org,m:ronniesahlberg@gmail.com,m:rodrigo.vivi@intel.com,m:dsterba@suse.com,m:shakeel.butt@linux.dev,m:ceph-devel@vger.kernel.org,m:konishi.ryusuke@gmail.com,m:osalvador@suse.de,m:jani.nikula@linux.intel.com,m:gfs2@lists.linux.dev,m:linux-nfs@vger.kernel.org,m:baolin.wang@linux.alibaba.com,m:joseph.qi@linux.alibaba.com,m:dri-devel@lists.freedesktop.org,m:muchun.song@linux.dev
 ,m:jlayton@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:chuck.lever@oracle.com,m:linux-btrfs@vger.kernel.org,m:tzimmermann@suse.de,m:hannes@cmpxchg.org,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:jackmanb@google.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,manguebit.org,redhat.com,kernel.org,linux.intel.com,google.com,kvack.org,fb.com,dilger.ca,suse.de,lists.samba.org,vger.kernel.org,gmail.com,lists.infradead.org,ffwll.ch,fasheh.com,bytedance.com,linux.dev,oracle.com,ursulin.net,ziepe.ca,dubeyko.com,nvidia.com,brown.name,microsoft.com,lists.freedesktop.org,talpey.com,evilplan.org,intel.com,suse.com,linux.alibaba.com,lists.sourceforge.net,samba.org,cmpxchg.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[columbia.edu,redhat.com,auristor.com,kernel.org,linux-foundation.org,oracle.com,google.com,suse.com,tencent.com,huaweicloud.com,gmail.com,infradead.org,intel.com,suse.cz,zeniv.linux.org.uk,mit.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[96];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[david@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[columbia.edu:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 95ABD1A650F
X-Rspamd-Action: no action

On 2/26/26 00:44, Tal Zussman wrote:
> struct pagevec no longer exists. Rename the macro appropriately.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---

Acked-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
