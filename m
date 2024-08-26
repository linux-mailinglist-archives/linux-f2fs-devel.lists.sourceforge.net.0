Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 312B095F7AA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Aug 2024 19:14:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sidIR-0007HE-QB;
	Mon, 26 Aug 2024 17:14:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joshi.k@samsung.com>) id 1sidIQ-0007H3-O5
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Aug 2024 17:14:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Po2gU7Tj1IXZMxwPWnpQrOZ+vFEA/kofumpkR30jMIU=; b=cmTdxgByipQKvOEj3qDtxuOuhp
 TiR2pirHS+/chGZZYGJ1qeBT8hK4/mHYEig1Ij2F3axcDfjIxiVVtODtN4fsbpBAq5mfzPD6hIab9
 VEDiSsXMN+MDUzCNPrJPrRmC3q0+CkqJ0hTs4BQgBM7ns+cbcKolB2ATP25VPsbBpxPY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Po2gU7Tj1IXZMxwPWnpQrOZ+vFEA/kofumpkR30jMIU=; b=h
 FGFDXWPephdosmUf6xTAMwsVlsA/uyPlaXr2p1fKmc6+LkpFoFnwrpOeMwZYQtOCY5Aam4s5Ks1I6
 l70Ros+uQQRQb7lKHPpgGwSJoYuKLTJp9s17w7L9TGvBRST0adSsb+K/Sz/VMOAFHP/5Avys/l5Km
 Pebhb6nZNG9Y5XVE=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sidIP-0005I3-7c for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Aug 2024 17:14:26 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20240826171412epoutp0411bfb09b2b3aa3dba9548192f3f95965~vVqXjKJrZ0762207622epoutp04_
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Aug 2024 17:14:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20240826171412epoutp0411bfb09b2b3aa3dba9548192f3f95965~vVqXjKJrZ0762207622epoutp04_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1724692452;
 bh=Po2gU7Tj1IXZMxwPWnpQrOZ+vFEA/kofumpkR30jMIU=;
 h=From:To:Cc:Subject:Date:References:From;
 b=kACi0uutz/JVECZ5teosHI8WGM9SKa0OHvbP5bdqcnS1XsN5DvIQH7gv/VushIqJo
 fXe0I076oDp1ZjrTkUMy9dq0vVHHdqcwahrhEx8Yl9jDOon1H9PqRTzow2XXug8ynU
 msRrbYBTgssUDczi3ZNyDeVvEHKoVogvD5q5c6hc=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20240826171412epcas5p3131af6d126d29e121f88274b259a5d35~vVqW6MHli2946129461epcas5p3h;
 Mon, 26 Aug 2024 17:14:12 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.178]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Wsy2V308wz4x9Pt; Mon, 26 Aug
 2024 17:14:10 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 0D.A3.09642.2E7BCC66; Tue, 27 Aug 2024 02:14:10 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20240826171409epcas5p306ba210a9815e202556778a4c105b440~vVqUt5c6C2946129461epcas5p3f;
 Mon, 26 Aug 2024 17:14:09 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240826171409epsmtrp21dff6590920e7f62967e1b0cd6fa8b5f~vVqUs0lps3048030480epsmtrp2V;
 Mon, 26 Aug 2024 17:14:09 +0000 (GMT)
X-AuditID: b6c32a4b-613ff700000025aa-42-66ccb7e27d64
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 95.B2.07567.1E7BCC66; Tue, 27 Aug 2024 02:14:09 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240826171405epsmtip2435567b12708596c83fb75f46f239673~vVqRFnxQu0040200402epsmtip2b;
 Mon, 26 Aug 2024 17:14:05 +0000 (GMT)
From: Kanchan Joshi <joshi.k@samsung.com>
To: axboe@kernel.dk, kbusch@kernel.org, hch@lst.de, sagi@grimberg.me,
 martin.petersen@oracle.com, James.Bottomley@HansenPartnership.com,
 brauner@kernel.org, jack@suse.cz, jaegeuk@kernel.org, jlayton@kernel.org,
 chuck.lever@oracle.com, bvanassche@acm.org
Date: Mon, 26 Aug 2024 22:36:01 +0530
Message-Id: <20240826170606.255718-1-joshi.k@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfUwTZxz2vTuuh7HkVjS+I4p4zj9gAi3SciyA6Mi8rcvS7DMj2eBWjo8A
 bddrJ5NNccxNuglSFBUlVkLYLONTQLTDOCo6HA5CkQmIVCwsk4lAtyFCYC2Hm/89v+f9Pb/n
 eb8IVDKABxAZGgOn17BZFL4aa7EHB4eOXuhKlfaeI+nq4SKcnrDPALp0ag6ll4Z/R+iBKxcR
 +lx1B0KfOp6P0K66MpRuKCLo+3fcInquyiqiO5Ye4rS5vR/QbYMv0r0Vu+kf2zox+kzVmIj+
 5rdWnP7u+iJC1048wujustOi+HWMo0/JdN9twJhS8w2ccdw0Mo3WApw5X7mfsVncCGMbyMOZ
 6bFBjClssgKmy3JVxLgbA1VrEjNj0jk2hdMHcRq1NiVDkxZLKd9KejlJrpDKQmXRdBQVpGGz
 uVgq4XVV6CsZWZ6dUkGfsFlGD6VieZ4Kj4vRa40GLihdyxtiKU6XkqWL1IXxbDZv1KSFaTjD
 SzKpNELuaUzOTL+89IuPbprMqXFYRXmgQGwCvgQkI+GR232YCawmJKQNQGf5GBCKGQB76gp8
 hOIfAO8tTGJPJbVFXSJhoQ3A2YqJFb0bwD+s3R49QeBkMOwpMXr5tWQ+AhtqnuDeAiXNCJx2
 1uDeUf6kHNrHzyJejJFbYeeXZtSLxWQ0HKipRAW7TfBk76xI4J+DnSddyzFQD5/ffGqlx0XA
 vkXeawzJBHihWC/Q/vDB9SaRgAOge7INF3AmdI46V3bzGWw9X+gj4B0wb+G2j3cM6slfdylc
 cPKDh+ddiDBdDA99JRG6N8O75rEV5Xp470TlCmbgoO2vZScJ+QH8YngRPQICy57JX/ZM/rL/
 zSwAtYLnOR2fncbxct12Dbfnv7tUa7MbwfIbD1G2glHnVFg7QAjQDiCBUmvFgY7OVIk4hf10
 L6fXJumNWRzfDuSeQy1GA9aptZ5PojEkySKjpZEKhSIyertCRq0XTxwsT5GQaayBy+Q4Had/
 qkMI34A8pCOnxIb4F2+7LN21Z2jT25c67TbTqqFjlTuZWccPGfLkgzm/qgpZ3TZ13EN3/BVd
 XGq1wpKLDcms4b0not7YWJi8+YUHrfWHFvubtab63MHTt/oiSlw3+qnivY9JaPlTShlqs0M2
 +IN9Be+9uiHqnZCRuUeSKHXV8TW6ucF5v6uHvw3rOfN1d8SHd8a79zsyZ/cl6L93XsttPjo3
 Mr7lLPB9zYx8fPFne+JUUKEzUfXurpjP9cc0t1bV41aVEhnFipw77PL50q2TpqGbse+bp3ya
 cn5amn1T2accQVuu7VY/ue93IH96p+ujOuPjlvhp00KERBp3YHzLjOXoxih3+d8VfhTGp7Oy
 EFTPs/8CWXJOt2wEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsWy7bCSvO7D7WfSDHa/VLZYfbefzeL14U+M
 FtM+/GS2+H/3OZPFzQM7mSxWrj7KZDF7ejOTxZP1s5gtNvZzWDy+85nd4ueyVewWR/+/ZbOY
 dOgao8XeW9oWlxa5W+zZe5LFYv6yp+wW3dd3sFksP/6PyWLd6/csFudnzWF3EPW4fMXb4/y9
 jSwe0yadYvO4fLbUY9OqTjaPzUvqPXYv+MzksftmA5vHx6e3WDz6tqxi9Diz4Ai7x+dNcgE8
 UVw2Kak5mWWpRfp2CVwZ+/6fZi34KFCx9vIq9gbGTt4uRk4OCQETiXX9Z9i7GLk4hAR2M0o8
 +PCaCSIhLtF87Qc7hC0ssfLfc6iij4wSO56vBHI4ONgENCUuTC4FiYsITGaSaHq4hQXEYRaY
 wySxvHM7M0i3sICpxOFnC8GmsgioSpxsmQQW5xWwlLi5dgkzxAZ5iZmXvrNDxAUlTs58wgJi
 MwPFm7fOZp7AyDcLSWoWktQCRqZVjJKpBcW56bnJhgWGeanlesWJucWleel6yfm5mxjB8aal
 sYPx3vx/eocYmTgYDzFKcDArifDKXT6ZJsSbklhZlVqUH19UmpNafIhRmoNFSZzXcMbsFCGB
 9MSS1OzU1ILUIpgsEwenVANT+JdsVgHpuo6Uf37BDWufbE2P5Sy227qyK0nWbO4x1qvfvt/e
 HaWXL2dXdFfvMNv0jAlWt2OLRO0WfqlcJX5VTfvRq7JtqvdijB6eKK79vuXHp82JAdN7fpzc
 9sf+mbzlrzKpgI4SZu0djevmiTocEd67XfiIRbaerFSlbMemdYW8HzLWrNAwPKayblnpfJ7F
 okmz55TyiOqblz4wcdgiPX2br+RMnWmtDyq3cuTNFhd/6PxESX3uqRa5T6EvDNc+32kToLI7
 QOJWUM7u+VGnKh83Hanui5E+VOQvkhq5eSu/6vtgn866PkblELf/quzsLlO8gzUO3u6dkpHq
 elpvReI/adbq+E/H9+lc71BiKc5INNRiLipOBADy+3UfJgMAAA==
X-CMS-MailID: 20240826171409epcas5p306ba210a9815e202556778a4c105b440
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240826171409epcas5p306ba210a9815e202556778a4c105b440
References: <CGME20240826171409epcas5p306ba210a9815e202556778a4c105b440@epcas5p3.samsung.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Current write-hint infrastructure supports 6
 temperature-based
 data life hints. The series extends the infrastructure with a new
 temperature-agnostic
 placement-type hint. New fcntl codes F_{SET/GET}_R [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [203.254.224.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.34 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sidIP-0005I3-7c
Subject: [f2fs-dev] [PATCH v4 0/5] Write-placement hints and FDP
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
Cc: vishak.g@samsung.com, linux-scsi@vger.kernel.org, gost.dev@samsung.com,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 javier.gonz@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Current write-hint infrastructure supports 6 temperature-based data life
hints.
The series extends the infrastructure with a new temperature-agnostic
placement-type hint. New fcntl codes F_{SET/GET}_RW_HINT_EX allow to
send the hint type/value on file. See patch #3 commit description for
the details.

Overall this creates 128 placement hint values [*] that users can pass.
Patch #5 adds the ability to map these new hint values to nvme-specific
placement-identifiers.
Patch #4 restricts SCSI to use only life hint values.
Patch #1 and #2 are simple prep patches.

[*] While the user-interface can support more, this limit is due to the
in-kernel plumbing consideration of the inode size. Pahole showed 32-bit
hole in the inode, but the code had this comment too:

/* 32-bit hole reserved for expanding i_fsnotify_mask */

Not must, but it will be good to know if a byte (or two) can be used
here.

Changes since v3:
- 4 new patches to introduce write-placement hints
- Make nvme patch use the placement hints rather than write-life hints

Changes since v2:
- Base it on nvme-6.11 and resolve a merge conflict

Changes since v1:
- Reduce the fetched plids from 128 to 6 (Keith)
- Use struct_size for a calculation (Keith)
- Handle robot/sparse warning

Kanchan Joshi (4):
  fs, block: refactor enum rw_hint
  fcntl: rename rw_hint_* to rw_life_hint_*
  fcntl: add F_{SET/GET}_RW_HINT_EX
  nvme: enable FDP support

Nitesh Shetty (1):
  sd: limit to use write life hints

 drivers/nvme/host/core.c   | 81 ++++++++++++++++++++++++++++++++++++++
 drivers/nvme/host/nvme.h   |  4 ++
 drivers/scsi/sd.c          |  7 ++--
 fs/buffer.c                |  4 +-
 fs/f2fs/f2fs.h             |  4 +-
 fs/f2fs/segment.c          |  4 +-
 fs/fcntl.c                 | 79 ++++++++++++++++++++++++++++++++++---
 include/linux/blk-mq.h     |  2 +-
 include/linux/blk_types.h  |  2 +-
 include/linux/fs.h         |  2 +-
 include/linux/nvme.h       | 19 +++++++++
 include/linux/rw_hint.h    | 20 +++++++---
 include/uapi/linux/fcntl.h | 14 +++++++
 13 files changed, 218 insertions(+), 24 deletions(-)

-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
