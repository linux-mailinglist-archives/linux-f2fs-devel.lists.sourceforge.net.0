Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB8952748D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 May 2022 00:53:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nq0dN-0002th-CQ; Sat, 14 May 2022 22:53:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <info@gmail.com>) id 1nq0dM-0002tY-Qt
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 May 2022 22:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Date:From:To:Subject:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Message-ID:Cc:
 Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:
 Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BhpxYm+zfGG6ckfFLQ6uRvkCIbQ0hmIU03wQwuTlmQc=; b=iHe9bdalrb31MYcwNNmb8xMWap
 qm4ejlsqkoqacO2fV9f1K6DsjtRd4A4bDpUp65IGmPeduNj3j8Bur6W9M8q2Uaenbb9RAmEujt3b3
 Paj/YXNIfXl9NsMNUxescElX7tmRcN4fB3qiVkS++3o1ndI2ATi+DHwgBEUaK84EpZq0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Reply-To:Date:From:To:Subject:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Message-ID:Cc:
 Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:
 Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BhpxYm+zfGG6ckfFLQ6uRvkCIbQ0hmIU03wQwuTlmQc=; b=Xv/vd5xD8r7333xnI5Ab2PX1r+
 AuzS2kHp18FemUFWEHI89Plj/YR3ESFotK+9SEoJlCC6D4tqWXzZQecOS9zouNhnhkI1n1x+eAxTx
 b+NGZ2xtRf3hZA9omNpk4jJzEx4RdTJqplUCegEkegdUlzWf/cXSGVHRxOpkI4kpk/3M=;
Received: from cloud46308.mywhc.ca ([72.10.162.214])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nq0dM-0006vQ-6I
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 May 2022 22:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=webventure.ca; s=default; h=Reply-To:Date:From:To:Subject:
 Content-Description:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Message-ID:Cc:Content-ID:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BhpxYm+zfGG6ckfFLQ6uRvkCIbQ0hmIU03wQwuTlmQc=; b=oX03nKPrNthDLJI65dEzo5vkP8
 7isLj830hWZjGO0ob+GFMT7qqcK/l9X0n6at+PXaPM62bTp2+MdrpYGGfxOKBroyW6qSi4DiCWcYZ
 gtJiguYWZkUcaXyCth/25vsVGtPgQfJWGfvApTMzCfe0dt1CBZvFl3So8tnSdA6AMckyKeGkoajMu
 CUZYRmeciCHaGtFIe1a02HQf80Rq4KG1jrcFPR7evvZhJEM+fLCF3VJqKEee4fQ61OTC5RiSJ5lPx
 avdzQJsk2XBoN6Kp4H56nhQUnmL609WVr02lGrAZt6XW+9IddKQRXfU+rN2Eu5Vb7D1h9XhFFVKu1
 qwTRApqQ==;
Received: from [197.94.69.188] (port=52804 helo=LAPTOP-TU40EMK7.home)
 by cloud46308.mywhc.ca with esmtpsa (TLS1) tls
 TLS_DHE_RSA_WITH_AES_256_CBC_SHA (Exim 4.95)
 (envelope-from <info@gmail.com>) id 1nq0V6-00022G-C8
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 May 2022 18:44:44 -0400
MIME-Version: 1.0
Content-Description: Mail message body
To: linux-f2fs-devel@lists.sourceforge.net
From: "Barr. Jerry McCumber" <info@gmail.com>
Date: Sun, 15 May 2022 06:44:33 +0800
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cloud46308.mywhc.ca
X-AntiAbuse: Original Domain - lists.sourceforge.net
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - gmail.com
X-Get-Message-Sender-Via: cloud46308.mywhc.ca: authenticated_id:
 test@webventure.ca
X-Authenticated-Sender: cloud46308.mywhc.ca: test@webventure.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Score: 6.1 (++++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Jerry D. McCumber, P.C.: Law Firm Decatur, GA. PO Box 178
 Decatur, GA 30031-0178 Attention prospective client Kindly write back if you
 will be interested to be the beneficiary to the late Arthur Mealer . 
 Content analysis details:   (6.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
 digit [jerrymccumber86[at]gmail.com]
 1.0 FORGED_GMAIL_RCVD      'From' gmail.com does not match 'Received'
 headers
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 DKIM_ADSP_CUSTOM_MED   No valid author signature, adsp_override is
 CUSTOM_MED
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.1 MISSING_MID            Missing Message-Id: header
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
 1.2 NML_ADSP_CUSTOM_MED    ADSP custom_med hit, and not from a mailing
 list
X-Headers-End: 1nq0dM-0006vQ-6I
Subject: [f2fs-dev] Attention prospective client
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
Reply-To: jerrymccumber86@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
Message-Id: <E1nq0dN-0002th-CQ@sfs-ml-1.v29.lw.sourceforge.com>

Jerry D. McCumber, P.C.: Law Firm
Decatur, GA.
PO Box 178
Decatur, GA 30031-0178    

 Attention prospective client

 Kindly write back if you will be interested to be the beneficiary to
 the late Arthur Mealer .

Jerry McCumber                  
Attorney at Jerry D. McCumber
                    
  

		


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
