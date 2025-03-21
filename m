Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B628A6B315
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Mar 2025 03:58:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tvSaM-0005uM-R4;
	Fri, 21 Mar 2025 02:58:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao.sigma@gmail.com>) id 1tvSaL-0005uF-Ll
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Mar 2025 02:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S447nBCZ5qz1dgsS7t4G7vGWWAqy5N52biZgpco2oDI=; b=Y3C96r368rz5qRc0aqHI0QuQzJ
 tp3plEpeVpbwuwbcuMrA0uWJm6qLUO4G3r5DEdpL9rZ3CrIlfkPjfGUa9hDqZUG8CLiFsalKuon5E
 YGLX4HqBLzec4QNymh1Uix+zQ41EoCj0c/741bjiAoNsA6Vtr3esP/GeL2AxAD+n5Ndw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=S447nBCZ5qz1dgsS7t4G7vGWWAqy5N52biZgpco2oDI=; b=W
 Oi4SNS88h+dW6MUDA7494HTEXQggj2lTaAnr+CE0Vj3Bv65PMeH9hH9finbW48lx9xDrDrd6iVLsp
 zJWdCjFGLXFkWAnhqGUw6G5uBS//+Xp+CDyP69kI7+ZL8Z0y+wOwddWYpsYbYEVjVsLOy7KAhaU00
 S9gNw9MxtWB2a+Vc=;
Received: from mail-oa1-f67.google.com ([209.85.160.67])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tvSaL-00077i-5h for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Mar 2025 02:58:14 +0000
Received: by mail-oa1-f67.google.com with SMTP id
 586e51a60fabf-2a01bcd0143so1713630fac.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 20 Mar 2025 19:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742525887; x=1743130687; darn=lists.sourceforge.net;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=S447nBCZ5qz1dgsS7t4G7vGWWAqy5N52biZgpco2oDI=;
 b=RPGN//hCrEe6WYDVDxe3XTad0OBVUVlgSRNJPvxVo25j2A+b8+FwOA+YdT+HFKkj7a
 CwIKsmI7OZiV2wcMjR6VRkcMYX+8YrN9UswL5+g9LpqgMleDBO030XAkbG+gRI9Flj+3
 F+CLz1wPnG7k5D1/O0bV0dDTMqmDrRigO4CWkGu+NFckT3LeJXSp05b8FvnfsURdCAjb
 Gb8TbKABOXjfA9pFYObRkrTZzyKABCSnoomGwWme7MmBoo3fgSYUWXHEF1y//uelskT+
 mPLxd2Ai9+eKkPm1rBkbCjJ1aMYTFnMM3jNswVnlwpDCdxFoZNb1nS749w9ilxbgoNnH
 veUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742525887; x=1743130687;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S447nBCZ5qz1dgsS7t4G7vGWWAqy5N52biZgpco2oDI=;
 b=pHrCEZGD0XAGbY3kkS9w+JrmWSIZz1u06LmNREUhhLg7+EGmPC/pv3Ss6br4wckxCM
 U9SH3mAZcbNcWZLoVfzJMzGPtC6lOQTuSRV18LTqagD+0iZIsvWXXFE1flBSl/r7NQF7
 fkNN8In2jqovuojViAaTKxU4CkVsd7O03+0d1A5AOVsRgMalM+1BJDN/G8sK77GSY2NB
 D3/UIMnCrAUJWJDtRnC+Y8OoxnOXaSnAsKABnZHNzOV+oMg3gwRu4nMAjfEw85Sr+j1Q
 iEwE0ukWjCfWyLJomXn8SBGAw71ArboV/VhmR3Z3BVWo9poS7dDR81m4ZiuVKwqt86ae
 rH5A==
X-Gm-Message-State: AOJu0YzCklLCe0x/IU181c2d/aIz6Ab2dBVrPB4YNT55hpLguVr6/oJ5
 4xJKh8w/DEm99q1i6SYOxOXGlKi4L7DqCnk4u+sDvIh2Ja8V5Z1yp8yALSheJqs3KNOJGwfWScF
 vCI8Hh3ozw2yBebcKqF90ToGemkYryNHuflw=
X-Gm-Gg: ASbGncuJI2R+/fu3G2yJt3PFHdbfOZ11UxW+fheii4Q5dDu1W5Zkyr/b9GpwLkLpTqK
 qCrXbg/VhgrgZdsnBqf6a3maUbYpEBpW0mrcKyHd2xx+Lca/IveQtWVIB6/KQ8iOvcuaFT51kZH
 RPrX+XfWm9LNZE7AzkLUGGIO2ZNDs=
X-Google-Smtp-Source: AGHT+IEtB/QKsumNF0e1z9H9Qp9BwGIYRKtCKNgszw0nvOKAwlR3PJztJUVfLRN2gdT77c0PDeJO9WMCZOG9cRnUa/w=
X-Received: by 2002:a05:6871:4102:b0:2a7:d8cb:5284 with SMTP id
 586e51a60fabf-2c780247c70mr1260446fac.7.1742525887002; Thu, 20 Mar 2025
 19:58:07 -0700 (PDT)
MIME-Version: 1.0
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Date: Fri, 21 Mar 2025 10:57:55 +0800
X-Gm-Features: AQ5f1Joey8ATtOGys54VZB9gojvqymtcK-pbMuPI0bEyPQS47Bhu25pX2DA4PgA
Message-ID: <CAMLCH1F8niz3qifu9pt6C3yLhonadD=feaPtWKhCaRD8FPJhRg@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Dear f2fs developers, My name is [Your Name], and I am an
 undergraduate student from Nanjing University of Technology in China. I am
 a newcomer to kernel development, and I am currently learning about f2fs
 and working on e [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.67 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.160.67 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.160.67 listed in bl.score.senderscore.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [nzzhao.sigma[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.67 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tvSaL-00077i-5h
Subject: [f2fs-dev] [DISCUSSION] f2fs: GC: Addressing Non-Contiguous Page
 Cache Indices for Large Folio Allocation
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

Dear f2fs developers,

My name is [Your Name], and I am an undergraduate student from Nanjing
University of Technology in China. I am a newcomer to kernel
development, and I am currently learning about f2fs and working on
enabling large folio support.

After studying the concept of folios, especially after listening to
Mr. Matthew Wilcox's talk on folios, if I understand correctly, the
most crucial requirement for folios is that the constituent pages must
be contiguous in both physical and virtual memory.  Furthermore, the
indices of these constituent pages within the page cache must also be
consecutive. For example, an order-2 folio, which comprises four
pages, must have page cache indices of 0, 1, 2, and 3.

Currently, the f2fs garbage collection code, primarily the
`gc_data_segment` and `gc_node_segment` functions, still interacts
with the page cache using the `page` structure directly. However,
refactoring them to interact with the page cache using folios
encounters a significant challenge.  Taking `gc_node_segment` as an
example, in phase 1, it pre-reads all node pages from a victim segment
into the page cache:

/* f2fs/gc.c */
/* line: 1024 */
static int gc_node_segment(struct f2fs_sb_info *sbi,
struct f2fs_summary *sum, unsigned int segno, int gc_type)
{
struct f2fs_summary *entry;
block_t start_addr;
int off;
int phase = 0;
bool fggc = (gc_type == FG_GC);
int submitted = 0;
unsigned int usable_blks_in_seg = f2fs_usable_blks_in_seg(sbi, segno);

start_addr = START_BLOCK(sbi, segno);

next_step:
entry = sum;

/* .... other code .... */

if (phase == 0) {
/* read ahead NAT block */
}

if (phase == 1) {
/* line: 1063 */
f2fs_ra_node_page(sbi, nid);
continue;
}

/* phase == 2: get node page, perform move node page, let page cache
* write them back */

}

if (++phase < 3)
goto next_step;

if (fggc)
atomic_dec(&sbi->wb_sync_req[NODE]);
return submitted;
}

The issue is that `f2fs_ra_node_page` directly inserts a key-value
pair into the page cache, using the nid as the index (key) and a page
as the value. However, within a segment, the nids recorded in the
`f2fs_summary_block` are not guaranteed to be contiguous. This
directly violates the folio requirement for consecutive page cache
indices. Although folios can represent a single page (if order is 0),
which means it's technically feasible to transition the interface from
`page` to `folio`. I have noticed Mr. Wilcox's recent patches working
on supporting folios in some GC-related functions.  However, this
non-contiguous index issue prevents us from allocating higher-order
folios during the GC process, thus limiting the potential benefits of
large folios for LRU reclaim and other aspects.

Now, I would like to propose some potential solutions that I have been
considering to address this issue.  I have two approaches in mind: one
is a more conservative approach, and the other is a more aggressive
one. Let's continue to use the pre-reading of node pages in phase 1 of
`gc_node_segment` as an example.

The more conservative approach would be to, before pre-reading node
pages, first retrieve all nids from the current summary block. Then,
we could de-duplicate these nids, sort them, and divide them into
clusters of as contiguous nids as possible.  For each cluster, we
could then allocate a folio with an order that best fits the cluster
size and place it into the page cache.

To illustrate the conservative approach with a more concrete example,
let's say a summary block contains the following nids: `[5, 3, 6, 1,
4, 9, 12, 9]`. We can process this list as follows:
 1. **De-duplication and Sorting:** First, we de-duplicate and sort
the nids, resulting in: `[1, 3, 4, 5, 6, 9, 12]`.
 2. **Clustering and Folio Allocation:** We can then identify
contiguous clusters. In this example, `[3, 4, 5, 6]` forms a
contiguous sequence. Therefore, we could allocate an order-2 folio to
accommodate this cluster of four nids. For the remaining nids `[1, 9,
12]`, we would allocate order-0 folios.

The more aggressive approach would be to remap the nids in the summary
block during the GC process, mapping them to contiguous integer
indices. This could potentially allow for better allocation of
higher-order folios. However, this approach would introduce
significant additional workload and overhead in multiple dimensions.
It would require maintaining an index remapping table in memory. Given
the potentially large number of nids, this might lead to considerable
memory consumption.

Furthermore, the additional lookup overhead would also be substantial,
especially considering that f2fs is often used in mobile devices,
which have stringent real-time performance requirements.  Moreover,
this approach would involve extensive code modifications.  Using
[https://elixir.bootlin.com/linux](https://elixir.bootlin.com/linux),
I found that `f2fs_get_node_page` is called in over 20 locations.
Implementing this aggressive approach would mean that all these calls
to `f2fs_get_node_page` would need to perform an extra lookup to
translate from the nid to the remapped index.

Therefore, I personally question whether introducing such significant
changes and incurring such substantial overhead is truly worthwhile,
especially just for the sake of higher-order folios.  Another unique
issue with this aggressive approach is its lack of generality compared
to the more conservative one.  The index discontinuity problem we
discussed actually exists for pre-reading NAT blocks, node blocks, and
data blocks in the GC process. However, NAT blocks, node blocks, and
data blocks have different numbering schemes and are managed by
different address_space page caches.  I have been using node page
pre-reading as an example for analysis, which implies that this index
remapping scheme I've conceived might not be suitable for data blocks
or NAT blocks.

In terms of next steps, I plan to focus on implementing the
conservative approach and submitting a patch for your review. As a
newcomer to kernel development, writing robust test cases is still a
challenge for me. Any pointers or best practices on testing in this
area would be immensely helpful. My main purpose in writing to the
list is to seek your expert opinions on two key questions: Firstly,
from your perspective, is the current inability of GC to allocate
higher-order folios a significant concern for f2fs? Secondly, I would
be very grateful for any feedback, especially critical feedback, on my
proposed solutions. I understand they are just initial ideas and
likely have room for improvement. Thank you for your time, patience,
and expertise. I am keen to learn from your feedback and contribute to
the f2fs community.
Best regards.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
