Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C93796C7456
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Mar 2023 01:07:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfUxW-0007uV-Qj;
	Fri, 24 Mar 2023 00:07:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=4408337f2=Damien.LeMoal@wdc.com>)
 id 1pfUxV-0007uO-6T for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Mar 2023 00:07:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YURS4vBwOzYLlTfOZTKv4c3dc1vsuHdYMZijRkrhA2k=; b=I/jwpVouJJzrfs7WRe3fg8Iiwx
 Ctp4BmA/6SmnvX/xYXHDAqtHBkQV3z27hPyhddwHeptYRuAu4gECoAAX+Br+eUp9MNloxT1QFzGr7
 /H+CVxPWk2lX+pgwFD4zApXoRGQVaAk03QwfEkK2b60mQMRgxflWWQBvpkQWnJPpxvZ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YURS4vBwOzYLlTfOZTKv4c3dc1vsuHdYMZijRkrhA2k=; b=Q/BD9FirAfZHJduMGPlpgHVrAW
 e0kvoQnG4WnF3gNQbKG4YJNWZ6dcmSMuIeVKLjwDHv+1lH83vMZEgGJeIrv0bcmpl+OtZ1x3HaS1P
 RYaee8Xt4cD5X9BiCIZhhB8hfpQneTMoyxvr+N343IyKs43ew8YSEpYg0dw7KItyKIcU=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pfUxS-000qEr-5T for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Mar 2023 00:07:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1679616422; x=1711152422;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YURS4vBwOzYLlTfOZTKv4c3dc1vsuHdYMZijRkrhA2k=;
 b=cK+Qz9tBI1sCj5XKwqK+T5W0xSwHPCAmDsKqDcQod4kPOKjcp1u7mXEi
 9AaP4NQ46si7cesae0yHYtqBbP1Bdnj94ZCuoZP9rACt9C2bYdvRHBYft
 RPLQXROtzIVsR/xLJ8Scw2y8l2rqpCS6UzsUS+fJN9RN+3CWeA7oLJQfO
 ANX/FwGiaBeuuICQcJW42ahNKUavo6cVd+zzcEZ2wS2cLB6qc5NMH2XQD
 P3OSIDn0543/bV/kM5eErQ4eYBCW4Dof6uAJbaGRlSKX0Dqkv/ta8MPif
 4AlUL1l9LDlPQIHlTMYKTU8NNAsBcBwManVj6xJ9uk9i3wO4Fs5IlEZZL Q==;
X-IronPort-AV: E=Sophos;i="5.98,286,1673884800"; d="scan'208";a="224660493"
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hgst.iphmx.com with ESMTP; 24 Mar 2023 08:06:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5Aw+Vd8hS3n/u+tk1rgcSt76x0WuzRq/5mg27Yy8+mQtJiht4vavUx7qF0ZL8AFWYp27+n2Py77FiqbzIPB3xQ5YKWvFT77+9NDZMKXxgDmGdFpqk+jpaMyygDtrVlaM0gbZdeNxyUQnafhYwwr2qMOOh310kTUjQsi5IKlCw/zWpvM5J1ILBfe2PjPD0YvqtxtTAchyBfXU2qmPVxc3Kzkd7FE8qFtxGZAd8WOvLUm9ErKul8Rhjaf1c6Fi5yhgRT7k0/XTZE+JbB/K86kWePzrH5k+hNxRdxxkJanlMNK4vPtlNElwYNGAHOhEFnVlFvPrazbipinKzZCDDbzMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YURS4vBwOzYLlTfOZTKv4c3dc1vsuHdYMZijRkrhA2k=;
 b=RXJ5Y4uiV7GHLFlENabdxifOHdGdZvWEMTQIzderkkPF8XTcr+H1ofN6toyuM4lZoBZ2NBBFZwqPDkWZuuiXtLKnwVtzgW/5CM8rhQPg+iLk/MwKtA2LCEQAWd5hrfm5R8MLgYisqW1M0M+ig6z9k671YxD6wMtgr57QJKlbwfjxQRuMtnrRF/rl2m36pcymmoWkLir5yp1cQVrtmrLj9pdLBq+WkMlArVPL3HpwYfyYJXoaAQslqojSDflWBeBAjWFPe2p3+y46Jds5dosnBKOsh2lo4sYVVJTIodKoDGLLO50PMNHu7bAa3J7ua3uBYfsmF7lpVL8MztxkVUNacQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YURS4vBwOzYLlTfOZTKv4c3dc1vsuHdYMZijRkrhA2k=;
 b=qt9FKsLJGxfa0vMxv9slz8MfBVuu7jDHy54WrNTtHB9bxrbBCqdaGC3VoiqVmQRaxDXYA4AY5BOoWkvQ7iMokNaeKUTa5FBgBIoAgn9Uow2U8PNneSJFHFSweKZ7y6P+ZGSUdTSJ//e8XBEh+qVEYJCGw4UDiHVqIa1cuj4Pqlc=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by CO6PR04MB7604.namprd04.prod.outlook.com (2603:10b6:303:b0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 00:06:53 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::b6bd:9281:f8bb:f22a]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::b6bd:9281:f8bb:f22a%9]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 00:06:53 +0000
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [RFC PATCH] f2fs: preserve direct write semantics when buffering
 is forced
Thread-Index: AQHZRSW5shjzpCUo40u+8cmEhE3wt68D2TwAgAVGSICAAA0kgIAADGQAgAAFuAA=
Date: Fri, 24 Mar 2023 00:06:52 +0000
Message-ID: <8207efb81cd1e9322ad608d313eb4b4bd5740e80.camel@wdc.com>
References: <20230220122004.26555-1-hans.holmberg@wdc.com>
 <ZBhisCo7gTitmKeO@infradead.org> <ZBzPYwcoLXkFngz8@google.com>
 <402cc90ce5defa81c937c3fcd09de1f6497459ee.camel@wdc.com>
 <ZBzkzg+lr+TOXZcW@google.com>
In-Reply-To: <ZBzkzg+lr+TOXZcW@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR04MB7081:EE_|CO6PR04MB7604:EE_
x-ms-office365-filtering-correlation-id: c64bcd20-9ca7-4e71-3080-08db2bfbac44
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 18/DUxq9TTldr1nETh6+E34mNrqrpupoM8UuiL2DgLQTpdk4s70SYabFl2kTREbwvp/3MIfutRoFdBnjsaT1LLmv7/dl5YX4BXsAqEAtrs4j4AGXEehHEn7mqI42uG2CnB5ApITuzaUSQjRrVeisUpaRpU86ECKbrhq3ORPv9ba82JH6f0mImNJDIs4ttxKjkriwCSKACFfY1H4kt4CWAVVXxGTR+sycim2+nU5kCBd7uD69WRYy8alRkCRViJv/D5BmcEFCfPbAnftM5cfCepQEa4OjYgElTXpiiDsFHXGTvsa0VCNJvdakS7ryaxMNouztN8WcZVpY8JcafMCq7+qayDsY5SXmNIjfo83BbbBdj0bIo76QRGqbO3mIMs2W4tD/+tdsAnh86shWzgAmjUkCM6/Pg1PrhhOfKtNWrC9AFSpVmdeBR9TT1oE6pVQrGAHVou5RsNxCeR1KhNDcK2Rd+xED740jMeKH2FO+cq78pbbmS4EMFOLeuq5cbQfp/O44elSSqrnuwbokarIUSqQwmXXFvxpPpy8/+b7JMsNxrOko+/Wb2ox9QNVVC7+4tIK/QT/f7X4BboGBetnMbJvNlQ8VsDDugqZNagHrJTMfrpt9Pk/e4o6kkVY/1ufr4r+bdDZVRU7lqwtFqpetqy3L/4bK/N/uTT8uEfuaoO2pVAPzXHhtu80Ppag0wSEBY90N1DS5kqnkQv/Bdo2R2w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199018)(91956017)(66946007)(66556008)(8936002)(66476007)(64756008)(66446008)(41300700001)(76116006)(6916009)(86362001)(4326008)(8676002)(36756003)(38100700002)(122000001)(6512007)(6506007)(38070700005)(26005)(2616005)(83380400001)(186003)(478600001)(316002)(6486002)(71200400001)(54906003)(82960400001)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ay9pei84SUJLbi81cjFYdVRqSmZSQ2Y1aUNmaldqVHZ5anpQWDhDVnJ6YkJ2?=
 =?utf-8?B?eTNLWnlZSk53SGx1akEwRnNZZUJ4SEdES3BBcnhXaWY5Vzh5dllwdHNoY0FK?=
 =?utf-8?B?ejlrZG1lTnRFSTgwS2o5VzBGRmhUM2dTM2FhMVpTK0NWM01pL1dZK2R3ZEU4?=
 =?utf-8?B?alpuR1FBS2tMUy9XUnBjczRHZFg5U1pCT2RSNHA3MC95KzdxekpWbWIzdlhY?=
 =?utf-8?B?dTRqUG1LRG0vaENJM253Z0dmcGZZZFM0cE1rczRNcUhMRStjNnRscGxaZnpV?=
 =?utf-8?B?L3VNNVpVMHhUSjdNTTZOaWVXeFZxQktaRE5QSGpTVUVndDZpZW42cmNNS1RB?=
 =?utf-8?B?VG1jQzVKY1pUL3lkNFIyd00zeUpzUjFhZkJWdllUeU9YSmRvNXhhZU0xRWh3?=
 =?utf-8?B?K1hkclRmYzhwUXVUaElvVXRHTSs4OUZtYWRZL1hRVFBWakdOdzc0aWlGRXVm?=
 =?utf-8?B?YVRkUktvc3BGZXgwZ3E5ZjVPcy9FSU5XaHN1QllFeXBaU2RJamNJMVQwQlZF?=
 =?utf-8?B?SUhJNFlIdDUyWnpOaVdOdVdwK0FZa3A0YklJMGlVR2VnbUlKSHJNbERMWmMv?=
 =?utf-8?B?RHZNckhlL25vNGNkeWEwVWxObFZXdmRlaVZJRnh0NkdtSjlrVEZPa09xdlZr?=
 =?utf-8?B?RzZhZEhYMEsvMERVZ1ZIWWR4bXI5NGRrWlRwNGRpQ1N0Nlo1Y0J0ejJRdWtK?=
 =?utf-8?B?dFBnVFN3c1htNjg1VXQ3QnlkTGhqNEtVOXlrNHFOZVhYT29aK1hPOEhmZmpK?=
 =?utf-8?B?NjFzWklYVmRBaGVPczRqNm1lSVFzdU55UjM0cjdWTUJDM2dwUFBXQ0Rxdmsy?=
 =?utf-8?B?eXJmSnI5WEJaeUJkdjZSQmFNM3pra2g5NmRlVVBERGJoWDM1S3VYRDIvbzJM?=
 =?utf-8?B?K3QxVTlMMjhkWkNPSW1VQlNCTmI5Y2RPN2tFZ1RDaTN6cHhJMVJTTUJUcWdj?=
 =?utf-8?B?MUtVZE54K3BFUTQvOUYrdG1JV0ZmemFhcEJuU3krS0ZJMFdJeVNYOVloK2FF?=
 =?utf-8?B?UU9YZmZhYk9OVyt3WmdhbEREaGUySXRJUnVORGtybjJGcTZYQ1Vsb1dYb3JX?=
 =?utf-8?B?Z3pkb2RtdjBrU2RzNk5zYzhuL0NuN3FicDB5T01HOVkxUnNENVJGclJaTlFl?=
 =?utf-8?B?Nktwd0tId1ZaczE2Y0t0eThRVlZPNnphS0FZTzRhcUlZbFZ5dk5EWTBZMk9r?=
 =?utf-8?B?WmllS1pjQWU4bFJWY2p5V2N1Q2pjL0JRMzlnNU1VSXVDcXAveDlNeEN2S0po?=
 =?utf-8?B?ZVNzVVB6ejJ6UUo5c0hYdVY4NTBsd3ZhSGdJUnF6dVpCS1JlaVFZZXZmTU9T?=
 =?utf-8?B?WFg4cmhFTmZQU2x6akNPejlicEs2MDBvSXk3aDB3dThFc1RyVzJQc3gwVHdh?=
 =?utf-8?B?dlNsekpyR1AvT2tDdnZzNURscERhVlArd1BRbGRpSVk4eW4xNVNFTmRxVi9D?=
 =?utf-8?B?TEI5ZmhHQUc4NWw5V2VKSFhGeXk0ZGlTVEJseHdHcjQ1eGM1M3BCVDY0aFlw?=
 =?utf-8?B?ODE1dDdlbktiQnlHZ1lOT01pSFIraDdtWXRWZzdWZ09yVVJIUkRiWDB0YVBy?=
 =?utf-8?B?c0RGN0o3YkNSTmdVNUMwVldTd2t6VWRSb1ZCS2lDZG5jMlJoL1dWMTNHaVFk?=
 =?utf-8?B?VHRmdENxMHFMV3cxLzIwUEh0bVdGYjc0Y1VvU2ZubFhPSVRyM1BGbzZrSWVP?=
 =?utf-8?B?QjdzdzRHYnZnK00rN3NQaTE3MjZ6ZmRTS0JoYmFva01xdUxjTkl1Lzh3RGdl?=
 =?utf-8?B?NG5pS0gwQmIwWStOK0NZdnphbTdWOFNVVnNkMVBxQnJyaFluSVlxaXRMdTU0?=
 =?utf-8?B?bnd2czlVMmw4Y0NVRmJnRUJpY21BTzYwdWE2ckpvLytITmdRb0VJNG5yc1Jm?=
 =?utf-8?B?TThSL1Noem5mT3h4bC9pUWlSWjB1QWNkazFIWEorTWtnUGRBSXF6RzBINDBm?=
 =?utf-8?B?OHE2RDNLZ1NVK3BWWFRIYWlHdWdCRnhPYTVNbWM0a0w2N1cvSjVydmlqdHUw?=
 =?utf-8?B?NmN1SExTL3FiR2xtZmEvY2twNEMveDhMVFNtdmZpUEFkRGd4ZzhyQVpReUJm?=
 =?utf-8?B?YWVIS1JDNkpLa0U4ZGpHV1NZb3U2allBd0pQdXMvbW1YNXlDa0V0S2VOVVd2?=
 =?utf-8?B?ODlkNWRxS2tDd2JYVnptaGZHd0dBdjJnMk5qMlFDUG5GSUhCcVBMaGN1by9Z?=
 =?utf-8?B?WXc9PQ==?=
Content-ID: <86039DAFEA7AA2418FA90F041718DC96@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?S2NaWmtWRFBQVk9pd1Y2MTFXbVUzZE9zcmRhV0FzaGRTaU9Ca2t2MU1MMDN0?=
 =?utf-8?B?ZS9oQWRwRUhkRWNteC9tVmRwOHdMcDNwTUxiODg4amw5S09IRzY2bWxzeHpu?=
 =?utf-8?B?d3Y2aGJhemlvamlVdGtSSDdnejEyRXVodnh1cXpXNXpPWGRCVWs2TkNybS9P?=
 =?utf-8?B?dWtyU1ZOQktabi94R05GcnNvaVYrZXpCU2xGSW5PbW9NK0FIVjlqbGFQUjhV?=
 =?utf-8?B?ZUhnTFhpdVE3cGN5L0VMM2RYVkJwaGh6YkVJc3hTSlZsWU1BL3lRZitoVlBt?=
 =?utf-8?B?UnQzTjd5akJZQTNHcWdzSG1uNjQ0U0xNY2FBT2FVNDNSd0pEU3pFZkpMb3Jz?=
 =?utf-8?B?MUZYTUVjZU8xTHNZVXZrcFp5bHpSa0FJbWQ0NUVKVExESVFNT0phcmJ0K3hW?=
 =?utf-8?B?QnZYWlRWU2FEVDZZdW9NMU02cU0zUkhTb1hEb1JkcDVJdkJ3U2Q3UW5rSlRi?=
 =?utf-8?B?RzRhdXZPK0VFY01hWUtzams0YlluRHY1bHdjOHVoVjN3eFdZOHE5RjFFZXY2?=
 =?utf-8?B?c01PZDZyNzRSaFdnaDJNQVZBNUFDa3RjVWxTTVdYSXRHVnJMcHlFcjdqSWRp?=
 =?utf-8?B?bG0xVFRTblZxRVFjZ1lhY2o1aW5xdnFyWWVSaVdvYlozNTBySlM4czdjTFZ4?=
 =?utf-8?B?UmxWWHBMWTlDUmdHZitYRUd0eUxuck5sRjhGWklnSEZ5ZERmN0psME1FRHRm?=
 =?utf-8?B?bk94aHBOMTF3ZHp5alBObzQzemMzYzV1bDN1aWdxVHVKS3VNbjZ2djBnbkZ5?=
 =?utf-8?B?bGhrS0NlSVNtaVdBaW1LbHZTcXhibTQvOE1RTFpLc1ZaYkYvWUtmbWY4YmRS?=
 =?utf-8?B?T29SSlVyMzFTdlk1WG9CNHM1dTJ6Rk45TzhzNU5SQVV1cWNPQjNlblphT3pT?=
 =?utf-8?B?Wk1vakZJSVhVV21iMFNlY3A3Qjh6MWhrdllkTHpDaGtXOHRDekl5NFd0a1U3?=
 =?utf-8?B?bCswbFNraTQxeGVKRzQzZXpVbkZYWjVEUVgrWmJQUVNhaWJ1OW1RRFM4bndV?=
 =?utf-8?B?d2NkSWJiOUtyVGttZThtOG56WThKWUtmMnJHVFpCb3pnVEZnV3MxSjFrVEYr?=
 =?utf-8?B?THV0QmhhLzVMek40bXBCdTJTQzdpZklJUkxTZ0xrNVZDQnlKYytoVHo3ZW9k?=
 =?utf-8?B?NFhqWFhIT01OTXUwVFF0dkJFYnFNSVB3djIrNjk4eFF3c2wvK3RncHVoblFi?=
 =?utf-8?B?dC9VZjhaZFFZakpvMkIyMGNiRjRYTHY3TDRXakxUZk1ubVVhZDhEUDMvOEFF?=
 =?utf-8?Q?Is0lFmHB+OIpL2V?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c64bcd20-9ca7-4e71-3080-08db2bfbac44
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2023 00:06:52.9836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SI82TBhDsU0MsbmJua+0MtTUVzyDGrNyxQ78dNtcYKswWVYS/q8jbTcgiis66dCcM1ASo4xERN0nvbE0fuvoxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7604
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 2023-03-23 at 16:46 -0700, Jaegeuk Kim wrote: > On
 03/23, Damien Le Moal wrote: > > On Thu, 2023-03-23 at 15:14 -0700, Jaegeuk
 Kim wrote: > > > On 03/20, Christoph Hellwig wrote: > > > > On Mo [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.154.42 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pfUxS-000qEr-5T
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: preserve direct write semantics
 when buffering is forced
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
From: Damien Le Moal via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Damien Le Moal <Damien.LeMoal@wdc.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "hch@infradead.org" <hch@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCAyMDIzLTAzLTIzIGF0IDE2OjQ2IC0wNzAwLCBKYWVnZXVrIEtpbSB3cm90ZToNCj4g
T24gMDMvMjMsIERhbWllbiBMZSBNb2FsIHdyb3RlOg0KPiA+IE9uIFRodSwgMjAyMy0wMy0yMyBh
dCAxNToxNCAtMDcwMCwgSmFlZ2V1ayBLaW0gd3JvdGU6DQo+ID4gPiBPbiAwMy8yMCwgQ2hyaXN0
b3BoIEhlbGx3aWcgd3JvdGU6DQo+ID4gPiA+IE9uIE1vbiwgRmViIDIwLCAyMDIzIGF0IDAxOjIw
OjA0UE0gKzAxMDAsIEhhbnMgSG9sbWJlcmcgd3JvdGU6DQo+ID4gPiA+ID4gQSkgU3VwcG9ydGlu
ZyBwcm9wZXIgZGlyZWN0IHdyaXRlcyBmb3Igem9uZWQgYmxvY2sgZGV2aWNlcw0KPiA+ID4gPiA+
IHdvdWxkDQo+ID4gPiA+ID4gYmUgdGhlIGJlc3QsIGJ1dCBpdCBpcyBjdXJyZW50bHkgbm90IHN1
cHBvcnRlZCAocHJvYmFibHkgZm9yDQo+ID4gPiA+ID4gYSBnb29kIGJ1dCBub24tb2J2aW91cyBy
ZWFzb24pLiBXb3VsZCBpdCBiZSBmZWFzaWJsZSB0bw0KPiA+ID4gPiA+IGltcGxlbWVudCBwcm9w
ZXIgZGlyZWN0IElPPw0KPiA+ID4gPiANCj4gPiA+ID4gSSBkb24ndCB0aGluayB3aHkgbm90LsKg
IEluIG1hbnkgd2F5cyBkaXJlY3Qgd3JpdGVzIHRvIHpvbmVkDQo+ID4gPiA+IGRldmljZXMNCj4g
PiA+ID4gc2hvdWxkIGJlIGVhc2llciB0aGFuIG5vbi1kaXJlY3Qgd3JpdGVzLg0KPiA+ID4gPiAN
Cj4gPiA+ID4gQW55IGNvbW1lbnRzIGZyb20gdGhlIG1haW50YWluZXJzIHdoeSB0aGUgZGlyZWN0
IEkvTyB3cml0ZXMgdG8NCj4gPiA+ID4gem9uZWQNCj4gPiA+ID4gZGV2aWNlcyBhcmUgZGlzYWJs
ZWQ/wqAgSSBjb3VsZCBub3QgZmluZCBhbnl0aGluZyBoZWxwZnVsIGluIHRoZQ0KPiA+ID4gPiBj
b21tZW50cw0KPiA+ID4gPiBvciBjb21taXQgbG9ncy4NCj4gPiA+IA0KPiA+ID4gVGhlIGRpcmVj
dCBJTyB3YW50cyB0byBvdmVyd3JpdGUgdGhlIGRhdGEgb24gdGhlIHNhbWUgYmxvY2sNCj4gPiA+
IGFkZHJlc3MsDQo+ID4gPiB3aGlsZQ0KPiA+ID4gem9uZWQgZGV2aWNlIGRvZXMgbm90IHN1cHBv
cnQgaXQ/DQo+ID4gDQo+ID4gU3VyZWx5IHRoYXQgaXMgbm90IHRoZSBjYXNlIHdpdGggTEZTIG1v
ZGUsIGRvZXNuJ3QgaXQgPyBPdGhlcndpc2UsDQo+ID4gZXZlbg0KPiA+IGJ1ZmZlcmVkIG92ZXJ3
cml0ZXMgd291bGQgaGF2ZSBhbiBpc3N1ZS4NCj4gDQo+IFpvbmVkIGRldmljZSBvbmx5IHN1cHBv
cnRzIExGUyBtb2RlLg0KDQpZZXMsIGFuZCB0aGF0IHdhcyBleGFjdGx5IG15IHBvaW50OiB3aXRo
IExGUyBtb2RlLCBPX0RJUkVDVCB3cml0ZQ0Kc2hvdWxkIG5ldmVyIG92ZXJ3cml0ZSBhbnl0aGlu
Zy4gU28gSSBkbyBub3Qgc2VlIHdoeSBkaXJlY3Qgd3JpdGVzDQpzaG91bGQgYmUgaGFuZGxlZCBh
cyBidWZmZXJlZCB3cml0ZXMgd2l0aCB6b25lZCBkZXZpY2VzLiBBbSBJIG1pc3NpbmcNCnNvbWV0
aGluZyBoZXJlID8NCg0KPiANCg0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
