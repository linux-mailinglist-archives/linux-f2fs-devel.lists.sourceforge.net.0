Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 107EAAD8A10
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jun 2025 13:11:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nC2BOuakoObfQ+fgh2BuarwcVxEt/RrfRqyz2rsoffs=; b=AJ0tb7XdMpTg82NNNlCzBJpfsI
	nqAqs5Y4qUXCi/kbfLSPOuYjBagg4BOWS5NVUpDEM3AT/rYeDej/6ayotkyPCjGGnsUzTWScICCVS
	pzG/oKAhUNT3HPIhFmuIage6R81FkYPtQww/LMCTmLyjj9OnJ6hFumsvl95E1Z2Ujokc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uQ2K1-0006mx-0p;
	Fri, 13 Jun 2025 11:11:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <giovanni.cabiddu@intel.com>) id 1uQ2Jv-0006mn-Ss
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 11:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:References:
 Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8/Cx+f8rTVJR7E9rFHuhqwRyqcTrLEplvZQgJimvF8k=; b=KxlKCbO8L1rIP4nLZDdNXszxOy
 QCpPTT67kSiKyhrBwsqiV6IOR+9yHEGkHSHH95ZVpjL8y3nr6TkZhmRUA2KlWy4IAcdtROG3fPOkc
 7CnXjTf4tQk6vM3EKsy9LFFe5rWI+uiZcfH6L/Nq2WMlGWPPAMztBnAC7PnR9XFBjGjQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:References:Message-ID:Subject:CC:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8/Cx+f8rTVJR7E9rFHuhqwRyqcTrLEplvZQgJimvF8k=; b=FfOzfP1T5xlj0JeQwQHPzPNNJK
 v+1Wd+0DRpAHHrTjhY2mBuGKrmar6JBi6dCO6hUnXOhzlRZTlXm86ESaNY0M0tp2f/+g1h+88xoFU
 Os/c9sI7OoCnQCmju6DrWJ+Y12h2aqxrWAFW9T/PGd5HBtLi1vZnv6D7X+Sr5xx3iTKM=;
Received: from mgamail.intel.com ([198.175.65.12])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uQ2Jg-0006MS-Lq for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 11:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749813085; x=1781349085;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l6E6nmJnWscDwtYON7NmvKEMEnam+0no3YBdvlIcDoo=;
 b=T+9a18mo3njCObgXeASvK/Poa4bvJSxolhH+H+JrVaXLUbcehILlGSMs
 kqr+cQme5B1v15GoS04jmYKnuEu1RiQ40EPSK8c1OeIyxm1JHtX40OlJ+
 ifuoYXKn1D89yHqvNr/2Q5NYqIyrRhyWdI6oL4NaHgvKzhbzWUOn5l13U
 ioHRLbUvT+tfGv17DhfrlABD1q8KiUunrkXMxec2lKKDioh3O9GWsQdpi
 lYFaK3XI3RKn4fmDjVj0cz4iVpbjvmED9+VUQHCweUFE5STh3K/eLvIXJ
 uHH9BLoxRJ20aS6EI0KHvYnUNWozkKqf3zi5fShf1Lq1WKzAXqvS+fPaI g==;
X-CSE-ConnectionGUID: 50xpVWPnQLSI4SZKX4foeg==
X-CSE-MsgGUID: YDs2dtrqQjKz3Y1N6/6XiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="63434780"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="63434780"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 04:11:20 -0700
X-CSE-ConnectionGUID: w7p/Y9DeSmideVQYZABwhQ==
X-CSE-MsgGUID: SNlZxnCOTs2L734RXY1LmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="151625404"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 04:11:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 04:11:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 04:11:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 04:11:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACbA7PJQn7cuhFBMPeqDUNdL/RxbCR0QcIMT9s/aNfg5DTllFIiSMCyy/jB0s/lxCCtt+jwouxXx4z5YzqvWHgzsn4OGh7z2IhQJduUqRfEqHn1lJoFQG4BS2yqqgOsvS8yh79I4lYxbRxZNW7YWqKFzttVCAHDVpafqpPDHSdb6E/VCu9qZC3wLQOIY7F1fpTBYiuB9uvqIF27Ine45FxSQ4g+bvtJQk34SyAagaQigVIGX3x/PCzqv3lFIpuvjTTJNAclV1M6aBEwwx4AlrCbNEv42CCRADSgtoEnzdWYkWRULeuvCFekK/DGARA9C6tOJoxuaI3WNo4xtE1l6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/Cx+f8rTVJR7E9rFHuhqwRyqcTrLEplvZQgJimvF8k=;
 b=wDflSDIBirHQtpK4Y2f3xSPIHmbOiLX5VZ6Y9mwKHs+klUtupnvQQ7U5g5STk3LBsGaGKPSIE1DKuGtyBPlzTKeweZbX3KVBDCGu2WWpodcMGy12JhzEFRieGUg/WxJwPSZBT++Bdcs0ElDaZTVOcsJ94AKC49PoWtYWuhJcdawno2OlK9QP9J5ZPHEUl3dpKQpHcG+zshcHRG1rtvjXDY/dO/EwbjyeerslH2YkEsVA5/i2g8QVeXmVA+HweJ9IU0Z/wOqIQwHyjE39akkIb52Pd99J5KmkEF+ZwaBSyq7jCIxSV3jwEPd2ilI2Iv+B7ipG5BPla/WA1fwDGTSzUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by CH3PR11MB8187.namprd11.prod.outlook.com (2603:10b6:610:160::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 11:11:02 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8835.019; Fri, 13 Jun 2025
 11:11:02 +0000
Date: Fri, 13 Jun 2025 12:10:54 +0100
From: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <aEwHPjxw4K6t5mgf@gcabiddu-mobl.ger.corp.intel.com>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
 <20250612005914.GA546455@google.com> <20250612062521.GA1838@sol>
 <aEqU0iU1tBrLEYUq@gcabiddu-mobl.ger.corp.intel.com>
 <20250612155743.GA3529549@google.com>
 <20250613012357.GA3603104@google.com>
Content-Disposition: inline
In-Reply-To: <20250613012357.GA3603104@google.com>
Organization: Intel Research and Development Ireland Ltd - Co. Reg. #308263 -
 Collinstown Industrial Park, Leixlip, County Kildare - Ireland
X-ClientProxiedBy: DUZPR01CA0084.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::11) To CY5PR11MB6366.namprd11.prod.outlook.com
 (2603:10b6:930:3a::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6366:EE_|CH3PR11MB8187:EE_
X-MS-Office365-Filtering-Correlation-Id: 93e51119-4945-4527-b9b7-08ddaa6afb78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RIBXQRQs7G5vfjTuvYdovZpurMsryspUzteje9Acsd228kS5FrH0Nk+OwAoL?=
 =?us-ascii?Q?lOGpVYArJSlMBUAswjqJe8k1m46JSuY1lHsw4iB0jjZWOOYwmTEs73U7WvAQ?=
 =?us-ascii?Q?xsZlb51LHXfnpK3BTOp3GESnJIHMj2gbXOkB1Z1G3lOZRzYdaDbV2ldXaVeV?=
 =?us-ascii?Q?1UK9Ql9MzNpB/m6Tl7s86vXFF6p4bWbxp7szHRMn0KXkC6fHdGIDpUhNpVH2?=
 =?us-ascii?Q?WvcLdjhI3d9KSD94BdqFgZpyqypRPqzgMgwj5OSbORqcNUBAtLzfR7GMmpZR?=
 =?us-ascii?Q?khiow99Ycb0OsySU+7oqE4jUSoifCB+AhWpda+Rncr2FRJIV2tzNjvXiotyL?=
 =?us-ascii?Q?NY8k1QgzI5N8Fg34r5bGJkyiFeBfQdXV56Xjkz+4TSDnxLScV4DdRqEZGWCa?=
 =?us-ascii?Q?BPpB9h9Txw8lxE0Yj7ViM2/7L9jmuvFiXFSZTDTyrd5GFZikyd6RMfcq2YAC?=
 =?us-ascii?Q?By7rAPxvbZPiY6Ftn3dTLi36w4qBnj/Nk52wnlZ4eirPqqpOknI4m7kFpHPx?=
 =?us-ascii?Q?B525FAMNwJeUu7r7Ur+dVwuxIbcUkWPJ9HSwb7wt+xnYBEeiw5ietI+ItoLj?=
 =?us-ascii?Q?V5YjSMKN8+n8oGK1WSxYCFc2y26i58BCFH2n3SjVJQcM2SUtQrQ/xeRMuz0a?=
 =?us-ascii?Q?J1wqhiircPSWHVDvmG/T7h60ob1yIhNrJoPowWWoCvsM8/RVAcLkZNGIJhPF?=
 =?us-ascii?Q?DyMrMHW66XA80V4Mo078gHy3RokY4knIIc/fyrEKpKv27vveIWfGzL81jLc/?=
 =?us-ascii?Q?eqg7o1fhiNRZvzgQrhvGrfgphhOTFi/Q5jwY0N4JeXBcuO9zKWb1JPE2n4XE?=
 =?us-ascii?Q?JHss0ws15jGVaAM5FAXIi+NdSMuVenbFqCtJFnmDYq4LP9h8EXIwR4t50606?=
 =?us-ascii?Q?k81Ddm/DdwNUKhRKr7Gr80ZFmWO/MN1BvXasFJGtuQqn6YIeIiSmHGd/4y+D?=
 =?us-ascii?Q?XZ/8RhMlnccgd4eZiQbY64iofEpNo5jUS6Hld26VGWeLqflo8Epkqb9a6mDJ?=
 =?us-ascii?Q?PULem7ad0iJXrF1Rii/lzlMpdi/Ftm7edyUg+OO5nOXOgCFsH8pumABr4Zp5?=
 =?us-ascii?Q?DLVVcDirtUCHhL/dbH8hTrpctgezXYTPSshC1XkTm4xhMFLpsxPbtGufCYkF?=
 =?us-ascii?Q?ygCdlLCnL9tjQaZNZVvzqFBLQvNvjWO6Jdy11ioLFYwqRH3MkiGb5j/FIaCO?=
 =?us-ascii?Q?r1Ofo9/lk8xeLcQHrIp7lLIkMKFMs0mtugLrYRdiI3yp3Awtm4Kbi6TIoMXr?=
 =?us-ascii?Q?Wui94CpvXZfEkhLFtIszzSgRm+bCwLplQFlyxDXVWNbq7EtSNeaSYdEG0vil?=
 =?us-ascii?Q?VT/UklxOTOB26TYf5dr2sTHiKvhpjmICDdMj1iDio1gfg8XQI+DVS5M6VynP?=
 =?us-ascii?Q?QBOGhYiGEKBlIeg0u6efHuavwI8n?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dfD3g7ZtZREHAAxZbsnboNc+C0VK4eZx7MbMWbBB0FE2uzDjqw+PyC4n0/vk?=
 =?us-ascii?Q?JY1qDhRY1rU/jLcKChn8k+EQCAqnBn4orhzbpZk+iYmFG9TFNJ2bVi2b4G5X?=
 =?us-ascii?Q?X36ov5+BBkD0KymgqcWWTmFC0xXrSsAvWfagTMYgJZh0pVjD5RYF8YneV9+O?=
 =?us-ascii?Q?cvQ2p6CtTUOTEuDAKbw8ohjLup9M744xJL3F01qVcXapVrK3SqCrByxfA2CW?=
 =?us-ascii?Q?OOWw36GYj0u2GrgwBOwHgMrxAOf+saUibnaYcYkafolOw9w0LJSR2sbjbHPZ?=
 =?us-ascii?Q?PVuXK8AkN5O/CkvCAiXocBJZmtqxv3xnlCf1sc03LSeuvlrRnINEVHL8gvu9?=
 =?us-ascii?Q?p3ffTdyqJx+esNrvW4vUNYBiwt6LWB0Qbp0a5cxLavKu7T5Iz/pVQXogSN2c?=
 =?us-ascii?Q?U72GzeNY1XM2PqWIuSs5fiazrT+7nI7Oan+0vfFmrucaKKD2dTfzvpg+Ws2L?=
 =?us-ascii?Q?1VBV8IWhDKdQuC2BMzvNJEI++hUbf63mC+L5VinR0dC/jzd/bmjcXrsMK2Qi?=
 =?us-ascii?Q?IL4kDPODnOI/fTzekFHwFJjFdutVUi3l65iSyImkuaiwbeZbpOsRAW4wX575?=
 =?us-ascii?Q?08ZpGCbfqnoCmOnF+34G5h2tlB/GIJMIRv/lyFSDC/c00Wu9q076mmErvyfA?=
 =?us-ascii?Q?uAM5A68hYj925nxRWz/3LgmS7uV674kKbgkI6FDkCdQd/vi/30m5GU6CF38H?=
 =?us-ascii?Q?fZaZIo7kCYzyONDCPFxYNaFzuo8ZBquowJsSKkgyYpkSIU2m8NF/AUnK9I6I?=
 =?us-ascii?Q?eJ4KjUE+r5izqwqYTSXs5NJyIi0PQYiPNt5hBstBoxtMkX0d0rmBcyram02i?=
 =?us-ascii?Q?Loe84CbLZHahc1JAGH04tQh0DdBr0WZeyvuQqmxv7wEzhpd/bkDvbMHRz0eo?=
 =?us-ascii?Q?k4aFgvzpW8chqa+vGyzkeAfjva0ZhwZmfeI7p5RD0N+FsAFakf5HZT07nuYz?=
 =?us-ascii?Q?BIqc7sDvkxbx4T0JuF6bnq46o/GcNefUVBp/d2WyXgspF7X+7n9cFVheUqBx?=
 =?us-ascii?Q?w+6xHyC8h+d5k8adOHYzX7PXrSh7ueklJX3xjgMUMEIOGkOEYYb7pfdwMg4u?=
 =?us-ascii?Q?RIR9VzZIqTFy676kW6DCQyuUK956/nKj3S6Qw5NXVjdgqGutyY4jp0OTGeW7?=
 =?us-ascii?Q?EIJM8k/GRTLU3NalgH7a09fEA03OR+ubo3wRH2rOpxP4WxAesjuqjGfVUVF5?=
 =?us-ascii?Q?a+Cs3TGLPZdCIrQeSoGRFTkWVBm0nth0FBvClB6DWON/iLHSRq1tuC5/VSPd?=
 =?us-ascii?Q?SgT0iqznOKU9tCi46gtsdWMFigQYnZYXULDUO7Enb3PNbHY3cTQynADIscb3?=
 =?us-ascii?Q?966d/Ygu4nTylDDkbYGLZrhnI8174aVD4g4yDed4xMzBRUVeIY4Ef2DMRC4z?=
 =?us-ascii?Q?g8R94o0Iv47sBY5A4287bAqvYMLUHlXAvR8FPUTjO099BoZxb3x7r0ILykv4?=
 =?us-ascii?Q?OgVUg2pVY9vYt+UjH+HUqd20SKZ2uykBAM9bzwz6CWR1tEdaEuOXAdO85DXD?=
 =?us-ascii?Q?hACam7+rRI1EmHomQShSO8WAsi2xlk9FzX8ujd2t4hWx9cEiGL7ENVRm+2eC?=
 =?us-ascii?Q?dLRNHgqOVGXJ1XH79ToAvYvzEMX9XPgpkVP6TtzER5n4M0KIx89awvMu5RUr?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e51119-4945-4527-b9b7-08ddaa6afb78
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 11:11:02.0308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oL9yadlFGCe9eiuPWfqtQy5Oe1kxZDIckPk6V51PoICCK5eppG2vY1zqRQWrYbRxbvZ9ot4xmf56k9TZ6qEMXFVeFR5z8I+93HiFHtNlmPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8187
X-OriginatorOrg: intel.com
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jun 13, 2025 at 01:23:57AM +0000, Eric Biggers wrote:
 > On Thu, Jun 12, 2025 at 03:57:43PM +0000, Eric Biggers wrote: > > On Thu,
 Jun 12, 2025 at 09:50:26AM +0100, Giovanni Cabiddu wrote: > > [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uQ2Jg-0006MS-Lq
Subject: Re: [f2fs-dev] [PATCH] fscrypt: don't use hardware offload Crypto
 API drivers
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, Simon Richter <Simon.Richter@hogyros.de>,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 13, 2025 at 01:23:57AM +0000, Eric Biggers wrote:
> On Thu, Jun 12, 2025 at 03:57:43PM +0000, Eric Biggers wrote:
> > On Thu, Jun 12, 2025 at 09:50:26AM +0100, Giovanni Cabiddu wrote:
> > > On Wed, Jun 11, 2025 at 11:25:21PM -0700, Eric Biggers wrote:
> > > 
> > > ...
> > > 
> > > > FWIW, here's what happens if you try to use the Intel QAT driver with dm-crypt:
> > > > https://lore.kernel.org/r/CACsaVZ+mt3CfdXV0_yJh7d50tRcGcRZ12j3n6-hoX2cz3+njsg@mail.gmail.com/
> > > 
> > > /s/happens/happened/
> > > 
> > > ... and it got fixed
> > > https://lore.kernel.org/all/20220506082327.21605-1-giovanni.cabiddu@intel.com/
> > 
> > But it reached users in the first place, including stable kernels.  And
> > apparently the issues were going on for years and were known to the authors of
> > the driver
> > (https://lore.kernel.org/linux-crypto/91fe9f87-54d7-4140-4d1a-eac8e2081a7c@gmail.com/).
> > 
> > We simply don't have issues like this with the AES-NI or VAES XTS code.
> > 
> > And separately, QAT was reported to be much slower than AES-NI for synchronous use
> > (https://lore.kernel.org/linux-crypto/0171515-7267-624-5a22-238af829698f@redhat.com/)
> > 
> > Later, I added VAES accelerated AES-XTS code which is over twice as fast as
> > AES-NI on the latest Intel CPUs, so that likely widened the gap even more.
> > 
> > Yet, the QAT driver registers its "xts(aes)" implementation with priority 4001,
> > compared to priority 800 for the VAES accelerated one.  So the QAT one is the
> > one that will be used by fscrypt!
> > 
> > That seems like a major issue even just from a performance perspective.
> > 
> > I expect this patch will significantly improve fscrypt performance on Intel
> > servers that have QAT.
> 
> I was curious, so I actually ran a benchmark on an Intel Emerald Rapids server.
> Specifically, I used a kernel module that repeatedly en/decrypted 4096-byte
> messages with AES-XTS using crypto_skcipher_en/decrypt().  That's basically what
> fscrypt's file contents encryption does, but here I just measured the raw crypto
> performance.  I tested both xts-aes-vaes-avx512 and qat_aes_xts.  For both, the
> difference between encryption and decryption was within the margin of error, so
> I'll give just one number for each.
> 
> Results:
> 
>     xts-aes-vaes-avx512: 16171 MB/s
>     qat_aes_xts: 289 MB/s
> 
> So, QAT is 55 times slower than the VAES-optimized software code!
> 
> It's even slower than the generic C code:
>      
>     xts(ecb(aes-generic)): 305 MB/s
> 
> Now, it could be argued that this is user error -- I "should" have created lots
> of asynchronous crypto requests for 4K blocks, submitted them all at once, and
> waited for them to complete.  Thus allowing parallel processing by QAT.
> 
> But, that's simply not what fscrypt does.  And even if it did, it could only
> plausibly help for large bios.  Short bios, for which latency is really
> important, would continue to be massively regressed by using QAT for them.
> 
> Even for large bios, it would have to get over 55 times faster to be worth it,
> which seems (very?) tenuous.
> 
> Also, as is known from dm-crypt which does do async processing, the code that's
> needed to do it is quite complex and error-prone.
> 
> In any case, async processing would be a theoretical future improvement.  It's
> simply not what fscrypt does today, or has ever done.
> 
> I also found that, even though I built the QAT driver as a loadable module, it
> was loaded automatically on the system and prioritized itself over the VAES-
> accelerated AES-XTS.  Thus, it would be what fscrypt uses on Intel servers where
> the QAT driver is enabled in kconfig, even just as 'm'.
I just sent a patch to lower the priority of the skcipher (and aead)
algorithms in the QAT driver. This should allow xts-aes-vaes-avx512 to be
selected by default.

As for the module loading behaviour: loadable modules are automatically
loaded at startup if hardware that matches the device IDs they support
is found.

Regards,

-- 
Giovanni


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
