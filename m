Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 170B028A044
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 10 Oct 2020 13:50:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kRDOc-00054U-8U; Sat, 10 Oct 2020 11:50:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <BMT@zurich.ibm.com>) id 1kRDOY-00053p-Hi
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 10 Oct 2020 11:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Content-Type:Content-Transfer-Encoding:
 References:MIME-Version:Date:Cc:To:From:Subject:In-Reply-To:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NiDLo4pOxkTOHNh379y2lMt59tGJeK9BGhibE+AHe30=; b=RJ/D8cCiRNHH46ZR8/JWyN4eRh
 E4ol8+D1Zu4lOClxMxIoextztl1ZwCvCNVu7BUyv9r4KBNkI8ddBkUoJzfXesH+vL6uyratnsFqYq
 GzwifX5TXUQwOfaFgCbzmy2gRFk+SZjB6SEwuAGDoYU5XWT0Fhvnr8jHCncwRyPCXHNU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Content-Type:Content-Transfer-Encoding:References:MIME-Version
 :Date:Cc:To:From:Subject:In-Reply-To:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NiDLo4pOxkTOHNh379y2lMt59tGJeK9BGhibE+AHe30=; b=K6HI/9A+IMpaSpG3rX5mKFvQ1E
 5Elkv8Jixqld422yxI+OGAJ3CZHXsmGn4vRcqlTnwZ1JwtxNYTthTkWmV93yixgs32YLpig8qykl6
 JVEcky8Th0l5T/RY6+h5x0sPaEmS8gdrI3/FkGr4/gvvcuIMCk4tnG5nfgwGBpHSpZm0=;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kRDOO-009Xzl-30
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 10 Oct 2020 11:50:38 +0000
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09ABWxmX162433
 for <linux-f2fs-devel@lists.sourceforge.net>; Sat, 10 Oct 2020 07:36:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : cc : date : mime-version : references :
 content-transfer-encoding : content-type : message-id; s=pp1;
 bh=NiDLo4pOxkTOHNh379y2lMt59tGJeK9BGhibE+AHe30=;
 b=fFl+sWZ60CJNW5vj7Uw0QdIFBZaJLDIK+TmFY7+uXdPQEExbAUVKU05YhKg5dS5u6J9M
 gRTcbWK1ehAiHgiW0QiEErv4vh+5MOV1iJMmz3AgZqVrCWi+Nh1nNGlGLl5qNxYu9TT3
 rsErWvzJTnT/TvD/yGmIkQ5cIJnW2dxyfP5KEerqQF50430xLTdRCdzrzGOBj/IVBjpb
 ZIGntFQpbgC01amsKXwfy1cB65UwCiqnbdgLT6Z6Qd+CSe7yV4n3BXy+qSd8xdiYdQTK
 an7SA2yY6csjDSnstIEkYdPhg6mYvKJGwGGY1NoLkcuzdqKyvDxx/5UGYpv3tzPn6Oq9 ZA== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.91])
 by mx0a-001b2d01.pphosted.com with ESMTP id 343bxtr8ym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>; Sat, 10 Oct 2020 07:36:56 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <linux-f2fs-devel@lists.sourceforge.net> from <BMT@zurich.ibm.com>;
 Sat, 10 Oct 2020 11:36:55 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Sat, 10 Oct 2020 11:36:50 -0000
Received: from us1a3-mail162.a3.dal06.isc4sb.com ([10.146.71.4])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2020101011364991-175970 ;
 Sat, 10 Oct 2020 11:36:49 +0000 
In-Reply-To: <20201009195033.3208459-11-ira.weiny@intel.com>
From: "Bernard Metzler" <BMT@zurich.ibm.com>
To: ira.weiny@intel.com
Date: Sat, 10 Oct 2020 11:36:49 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20201009195033.3208459-11-ira.weiny@intel.com>,
 <20201009195033.3208459-1-ira.weiny@intel.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 59823
X-TNEFEvaluated: 1
x-cbid: 20101011-2475-0000-0000-0000044A0339
X-IBM-SpamModules-Scores: BY=0.233045; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.421684; ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00013982; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01447073; UDB=6.00777937; IPR=6.01229775; 
 MB=3.00034472; MTD=3.00000008; XFM=3.00000015; UTC=2020-10-10 11:36:54
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-10-10 06:57:40 - 6.00011937
x-cbparentid: 20101011-2476-0000-0000-0000DAA5035B
Message-Id: <OF849D92D8.F4735ECA-ON002585FD.003F5F27-002585FD.003FCBD6@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-10_07:2020-10-09,
 2020-10-10 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: ziepe.ca]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [148.163.158.5 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1kRDOO-009Xzl-30
Subject: Re: [f2fs-dev] [PATCH RFC PKS/PMEM 10/58] drivers/rdma: Utilize new
 kmap_thread()
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
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
 Thomas Gleixner <tglx@linutronix.de>, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-rdma@vger.kernel.org, x86@kernel.org, ceph-devel@vger.kernel.org,
 io-uring@vger.kernel.org, cluster-devel@redhat.com, Jason
 Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, intel-wired-lan@lists.osuosl.org,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, linux-afs@lists.infradead.org,
 Faisal Latif <faisal.latif@intel.com>, linux-um@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-nfs@vger.kernel.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, drbd-dev@tron.linbit.com,
 amd-gfx@lists.freed.esktop.org, Dan Williams <dan.j.williams@intel.com>,
 Shiraz
 Saleem <shiraz.saleem@intel.com>, bpf@vger.kernel.org, linux-cachefs@redhat.com,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

-----ira.weiny@intel.com wrote: -----

>To: "Andrew Morton" <akpm@linux-foundation.org>, "Thomas Gleixner"
><tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>, "Borislav
>Petkov" <bp@alien8.de>, "Andy Lutomirski" <luto@kernel.org>, "Peter
>Zijlstra" <peterz@infradead.org>
>From: ira.weiny@intel.com
>Date: 10/09/2020 09:52PM
>Cc: "Ira Weiny" <ira.weiny@intel.com>, "Mike Marciniszyn"
><mike.marciniszyn@intel.com>, "Dennis Dalessandro"
><dennis.dalessandro@intel.com>, "Doug Ledford" <dledford@redhat.com>,
>"Jason Gunthorpe" <jgg@ziepe.ca>, "Faisal Latif"
><faisal.latif@intel.com>, "Shiraz Saleem" <shiraz.saleem@intel.com>,
>"Bernard Metzler" <bmt@zurich.ibm.com>, x86@kernel.org, "Dave Hansen"
><dave.hansen@linux.intel.com>, "Dan Williams"
><dan.j.williams@intel.com>, "Fenghua Yu" <fenghua.yu@intel.com>,
>linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
>linux-nvdimm@lists.01.org, linux-fsdevel@vger.kernel.org,
>linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
>linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
>netdev@vger.kernel.org, bpf@vger.kernel.org,
>kexec@lists.infradead.org, linux-bcache@vger.kernel.org,
>linux-mtd@lists.infradead.org, devel@driverdev.osuosl.org,
>linux-efi@vger.kernel.org, linux-mmc@vger.kernel.org,
>linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
>linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
>linux-ext4@vger.kernel.org, linux-aio@kvack.org,
>io-uring@vger.kernel.org, linux-erofs@lists.ozlabs.org,
>linux-um@lists.infradead.org, linux-ntfs-dev@lists.sourceforge.net,
>reiserfs-devel@vger.kernel.org,
>linux-f2fs-devel@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
>cluster-devel@redhat.com, ecryptfs@vger.kernel.org,
>linux-cifs@vger.kernel.org, linux-btrfs@vger.kernel.org,
>linux-afs@lists.infradead.org, linux-rdma@vger.kernel.org,
>amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
>intel-gfx@lists.freedesktop.org, drbd-dev@tron.linbit.com,
>linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
>linux-cachefs@redhat.com, samba-technical@lists.samba.org,
>intel-wired-lan@lists.osuosl.org
>Subject: [EXTERNAL] [PATCH RFC PKS/PMEM 10/58] drivers/rdma: Utilize
>new kmap_thread()
>
>From: Ira Weiny <ira.weiny@intel.com>
>
>The kmap() calls in these drivers are localized to a single thread.
>To
>avoid the over head of global PKRS updates use the new kmap_thread()
>call.
>
>Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>
>Cc: Dennis Dalessandro <dennis.dalessandro@intel.com>
>Cc: Doug Ledford <dledford@redhat.com>
>Cc: Jason Gunthorpe <jgg@ziepe.ca>
>Cc: Faisal Latif <faisal.latif@intel.com>
>Cc: Shiraz Saleem <shiraz.saleem@intel.com>
>Cc: Bernard Metzler <bmt@zurich.ibm.com>
>Signed-off-by: Ira Weiny <ira.weiny@intel.com>
>---
> drivers/infiniband/hw/hfi1/sdma.c      |  4 ++--
> drivers/infiniband/hw/i40iw/i40iw_cm.c | 10 +++++-----
> drivers/infiniband/sw/siw/siw_qp_tx.c  | 14 +++++++-------
> 3 files changed, 14 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/infiniband/hw/hfi1/sdma.c
>b/drivers/infiniband/hw/hfi1/sdma.c
>index 04575c9afd61..09d206e3229a 100644
>--- a/drivers/infiniband/hw/hfi1/sdma.c
>+++ b/drivers/infiniband/hw/hfi1/sdma.c
>@@ -3130,7 +3130,7 @@ int ext_coal_sdma_tx_descs(struct hfi1_devdata
>*dd, struct sdma_txreq *tx,
> 		}
> 
> 		if (type == SDMA_MAP_PAGE) {
>-			kvaddr = kmap(page);
>+			kvaddr = kmap_thread(page);
> 			kvaddr += offset;
> 		} else if (WARN_ON(!kvaddr)) {
> 			__sdma_txclean(dd, tx);
>@@ -3140,7 +3140,7 @@ int ext_coal_sdma_tx_descs(struct hfi1_devdata
>*dd, struct sdma_txreq *tx,
> 		memcpy(tx->coalesce_buf + tx->coalesce_idx, kvaddr, len);
> 		tx->coalesce_idx += len;
> 		if (type == SDMA_MAP_PAGE)
>-			kunmap(page);
>+			kunmap_thread(page);
> 
> 		/* If there is more data, return */
> 		if (tx->tlen - tx->coalesce_idx)
>diff --git a/drivers/infiniband/hw/i40iw/i40iw_cm.c
>b/drivers/infiniband/hw/i40iw/i40iw_cm.c
>index a3b95805c154..122d7a5642a1 100644
>--- a/drivers/infiniband/hw/i40iw/i40iw_cm.c
>+++ b/drivers/infiniband/hw/i40iw/i40iw_cm.c
>@@ -3721,7 +3721,7 @@ int i40iw_accept(struct iw_cm_id *cm_id, struct
>iw_cm_conn_param *conn_param)
> 		ibmr->device = iwpd->ibpd.device;
> 		iwqp->lsmm_mr = ibmr;
> 		if (iwqp->page)
>-			iwqp->sc_qp.qp_uk.sq_base = kmap(iwqp->page);
>+			iwqp->sc_qp.qp_uk.sq_base = kmap_thread(iwqp->page);
> 		dev->iw_priv_qp_ops->qp_send_lsmm(&iwqp->sc_qp,
> 							iwqp->ietf_mem.va,
> 							(accept.size + conn_param->private_data_len),
>@@ -3729,12 +3729,12 @@ int i40iw_accept(struct iw_cm_id *cm_id,
>struct iw_cm_conn_param *conn_param)
> 
> 	} else {
> 		if (iwqp->page)
>-			iwqp->sc_qp.qp_uk.sq_base = kmap(iwqp->page);
>+			iwqp->sc_qp.qp_uk.sq_base = kmap_thread(iwqp->page);
> 		dev->iw_priv_qp_ops->qp_send_lsmm(&iwqp->sc_qp, NULL, 0, 0);
> 	}
> 
> 	if (iwqp->page)
>-		kunmap(iwqp->page);
>+		kunmap_thread(iwqp->page);
> 
> 	iwqp->cm_id = cm_id;
> 	cm_node->cm_id = cm_id;
>@@ -4102,10 +4102,10 @@ static void i40iw_cm_event_connected(struct
>i40iw_cm_event *event)
> 	i40iw_cm_init_tsa_conn(iwqp, cm_node);
> 	read0 = (cm_node->send_rdma0_op == SEND_RDMA_READ_ZERO);
> 	if (iwqp->page)
>-		iwqp->sc_qp.qp_uk.sq_base = kmap(iwqp->page);
>+		iwqp->sc_qp.qp_uk.sq_base = kmap_thread(iwqp->page);
> 	dev->iw_priv_qp_ops->qp_send_rtt(&iwqp->sc_qp, read0);
> 	if (iwqp->page)
>-		kunmap(iwqp->page);
>+		kunmap_thread(iwqp->page);
> 
> 	memset(&attr, 0, sizeof(attr));
> 	attr.qp_state = IB_QPS_RTS;
>diff --git a/drivers/infiniband/sw/siw/siw_qp_tx.c
>b/drivers/infiniband/sw/siw/siw_qp_tx.c
>index d19d8325588b..4ed37c328d02 100644
>--- a/drivers/infiniband/sw/siw/siw_qp_tx.c
>+++ b/drivers/infiniband/sw/siw/siw_qp_tx.c
>@@ -76,7 +76,7 @@ static int siw_try_1seg(struct siw_iwarp_tx *c_tx,
>void *paddr)
> 			if (unlikely(!p))
> 				return -EFAULT;
> 
>-			buffer = kmap(p);
>+			buffer = kmap_thread(p);
> 
> 			if (likely(PAGE_SIZE - off >= bytes)) {
> 				memcpy(paddr, buffer + off, bytes);
>@@ -84,7 +84,7 @@ static int siw_try_1seg(struct siw_iwarp_tx *c_tx,
>void *paddr)
> 				unsigned long part = bytes - (PAGE_SIZE - off);
> 
> 				memcpy(paddr, buffer + off, part);
>-				kunmap(p);
>+				kunmap_thread(p);
> 
> 				if (!mem->is_pbl)
> 					p = siw_get_upage(mem->umem,
>@@ -96,10 +96,10 @@ static int siw_try_1seg(struct siw_iwarp_tx
>*c_tx, void *paddr)
> 				if (unlikely(!p))
> 					return -EFAULT;
> 
>-				buffer = kmap(p);
>+				buffer = kmap_thread(p);
> 				memcpy(paddr + part, buffer, bytes - part);
> 			}
>-			kunmap(p);
>+			kunmap_thread(p);
> 		}
> 	}
> 	return (int)bytes;
>@@ -505,7 +505,7 @@ static int siw_tx_hdt(struct siw_iwarp_tx *c_tx,
>struct socket *s)
> 				page_array[seg] = p;
> 
> 				if (!c_tx->use_sendpage) {
>-					iov[seg].iov_base = kmap(p) + fp_off;
>+					iov[seg].iov_base = kmap_thread(p) + fp_off;

This misses a corresponding kunmap_thread() in siw_unmap_pages()
(pls change line 403 in siw_qp_tx.c as well)

Thanks,
Bernard.

> 					iov[seg].iov_len = plen;
> 
> 					/* Remember for later kunmap() */
>@@ -518,9 +518,9 @@ static int siw_tx_hdt(struct siw_iwarp_tx *c_tx,
>struct socket *s)
> 							plen);
> 				} else if (do_crc) {
> 					crypto_shash_update(c_tx->mpa_crc_hd,
>-							    kmap(p) + fp_off,
>+							    kmap_thread(p) + fp_off,
> 							    plen);
>-					kunmap(p);
>+					kunmap_thread(p);
> 				}
> 			} else {
> 				u64 va = sge->laddr + sge_off;
>-- 
>2.28.0.rc0.12.gb6a658bd00c9
>
>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
